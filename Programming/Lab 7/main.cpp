#include <iostream>
#include <iterator>
#include <algorithm>
#include <memory>
#include <exception>

template <typename T,                                  //circular_buffer type
                                                       //(incl const)
          typename T_nonconst,                         //with any consts
          typename elem_type = typename T::value_type> //+ const for const iter
class circular_buffer_iterator
{
    public:

        typedef circular_buffer_iterator<T,T_nonconst,elem_type> self_type;

        typedef T                                   cbuf_type;
        typedef std::random_access_iterator_tag     iterator_category;
        typedef typename cbuf_type::value_type      value_type;
        typedef typename cbuf_type::size_type       size_type;
        typedef typename cbuf_type::pointer         pointer;
        typedef typename cbuf_type::const_pointer   const_pointer;
        typedef typename cbuf_type::reference       reference;
        typedef typename cbuf_type::const_reference const_reference;
        typedef typename cbuf_type::difference_type difference_type;

        circular_buffer_iterator(cbuf_type *b, size_type p)
            : buf_(b), pos_(p) {}

        // Converting a non-const iterator to a const iterator
        circular_buffer_iterator
           (const circular_buffer_iterator<T_nonconst, T_nonconst,
                                           typename T_nonconst::value_type>
            &other)
            : buf_(other.buf_), pos_(other.pos_) {}
        friend class circular_buffer_iterator<const T, T, const elem_type>;

        // Use compiler generated copy ctor, copy assignment operator and dtor

        elem_type &operator*()  { return (*buf_)[pos_]; }
        elem_type *operator->() { return &(operator*()); }
        
        self_type &operator++()
        {
            pos_ += 1;
            return *this;
        }
        self_type operator++(int)
        {
            self_type tmp(*this);
            ++(*this);
            return tmp;
        }

        self_type &operator--()
        {
            pos_ -= 1;
            return *this;
        }
        self_type operator--(int)
        {
            self_type tmp(*this);
            --(*this);
            return tmp;
        }

        self_type operator+(difference_type n) const
        {
            self_type tmp(*this);
            tmp.pos_ += n;
            return tmp;
        }
        self_type &operator+=(difference_type n)
        {
            pos_ += n;
            return *this;
        }

        self_type operator-(difference_type n) const
        {
            self_type tmp(*this);
            tmp.pos_ -= n;
            return tmp;
        }
        self_type &operator-=(difference_type n)
        {
            pos_ -= n;
            return *this;
        }

        difference_type operator-(const self_type &c) const
        {
            return pos_ - c.pos_;
        }

        bool operator==(const self_type &other) const
        {
            return pos_ == other.pos_ && buf_ == other.buf_;
        }
        bool operator!=(const self_type &other) const
        {
            return pos_ != other.pos_ && buf_ == other.buf_;
        }
        bool operator>(const self_type &other) const
        {
            return pos_ > other.pos_;
        }
        bool operator>=(const self_type &other) const
        {
            return pos_ >= other.pos_;
        }
        bool operator<(const self_type &other) const
        {
            return pos_ < other.pos_;
        }
        bool operator<=(const self_type &other) const
        {
            return pos_ <= other.pos_;
        }

    private:

        cbuf_type *buf_;
        size_type  pos_;
};

template <typename circular_buffer_iterator_t>
circular_buffer_iterator_t operator+
    (const typename circular_buffer_iterator_t::difference_type &a,
     const circular_buffer_iterator_t                           &b)
{
    return circular_buffer_iterator_t(a) + b;
}

template <typename circular_buffer_iterator_t>
circular_buffer_iterator_t operator-
    (const typename circular_buffer_iterator_t::difference_type &a,
     const circular_buffer_iterator_t                           &b)
{
    return circular_buffer_iterator_t(a) - b;
}

template <typename T,
bool     always_accept_data_when_full = true,
typename Alloc                        = std::allocator<T> >
class circular_buffer{
public:
    typedef circular_buffer<T, always_accept_data_when_full, Alloc>self_type;
    explicit circular_buffer(size_t capacity):
        array_(new T[capacity]),
        array_size_(capacity),
        head_(0), tail_(0),
        contents_size_(0){}
    ~circular_buffer()
        { delete [] array_; }
    typedef T          value_type;
    typedef T         *pointer;
    typedef const T   *const_pointer;
    typedef T         &reference;
    typedef const T   &const_reference;
    typedef size_t     size_type;
    typedef ptrdiff_t  difference_type;
    typedef circular_buffer_iterator
            <self_type, self_type>
            iterator;
    typedef circular_buffer_iterator
            <const self_type, self_type, const value_type>
            const_iterator;
    typedef std::reverse_iterator<iterator>       reverse_iterator;
    typedef std::reverse_iterator<const_iterator> const_reverse_iterator;
    reference front()
                   { return array_[head_]; }
    reference back()
                   { return array_[tail_]; }
    const_reference front() const
                   { return array_[head_]; }
    const_reference back() const
                   { return array_[tail_]; }
    void increment_tail() {
      ++tail_;
      ++contents_size_;
      if (tail_ == array_size_) tail_ = 0;
    }
    void increment_head(){
      ++head_;
      --contents_size_;
      if (head_ == array_size_) head_ = 0;
    }
    void push_back(const value_type &item) {
      if (!contents_size_) {
        array_[head_] = item;
        tail_ = head_;
        ++contents_size_;
      }
      else if (contents_size_ != array_size_)
      {
        increment_tail();
        array_[tail_] = item;
      }
      else {
        increment_head();
        increment_tail();
        array_[tail_] = item;
      }
    }
    void push_front(const value_type &item){
        if ( !contents_size_ ){
            array_[head_] = item;
            tail_ = head_;
            ++contents_size_;
        }
        else if (contents_size_ != array_size_){
          array_[head_] = item;
        }
        else{
          array_[head_] = item;
        }
    }
    void pop_front(){ increment_head(); }
    void pop_back(){
        --tail_;
        --contents_size_;
        if (tail_ == array_size_) tail_ = 0;
    }
    size_type size() const{
        return contents_size_;
    }
    size_type capacity() const{
        return array_size_;
    }
    bool empty() const{
        return !contents_size_;
    }
    size_type max_size() const{
        return size_type(-1) / sizeof(value_type);
    }
    void resize(size_type __sz){
        T *buffer = new T[this->contents_size_];
        for (int i = 0; i < contents_size_; i++){
            buffer[i] = operator[](i - 1);
        }
        delete[] array_;
        array_ = new T[__sz];
        for (int i = 0; i < contents_size_; i++){
            array_[i] = buffer[i];
        }
        delete[] buffer;
        this->array_size_ = __sz;
    }
    iterator         begin()       { return iterator(this, 0); }
    iterator         end()         { return iterator(this, size()); }
    iterator         index(size_type index_) { return iterator(this, index_); }

    const_iterator   begin() const { return const_iterator(this, 0); }
    const_iterator   end() const   { return const_iterator(this, size()); }
    const_iterator   index(size_type index_)
                             const { return const_iterator(this, index_); }

    reverse_iterator rbegin()      { return reverse_iterator(end()); }
    reverse_iterator rend()        { return reverse_iterator(begin()); }
    
    void push_it(iterator iter,const value_type &value){
        if (iter == begin())
                { push_front(value); }
        else if (iter == end() - 1)
                { push_back(value); }
        else{
            T* buffer = new T[contents_size_];
            int Nmax = 0;
            int posT = -1;
            int i = 0;
            for (auto it = begin(); static_cast<void>(it != end()), i <= array_size_; it++, i++){
                if (it == iter){
                    posT = i;
                    buffer[i] = value;
                    Nmax++;
                    i++;
                }
                buffer[i] = *it;
                Nmax++;
            }
            delete[] array_;
            array_ = new T[array_size_];
            for (int i = 0; i <= Nmax; i++)
                array_[i] = buffer[i];
            head_ = 0;
            tail_ = Nmax - 2;
            contents_size_ = Nmax - 1;
            delete[] buffer;
        }
    }
    void pop_it(iterator iter){
        if (iter == begin())
                { pop_front(); }
        else if (iter == end() - 1)
                { pop_back(); }
        else{
            T* buf = new T[contents_size_];
            int Nmax = 0;
            int i = 0;
            for (auto it = begin(); it != end(); it++, i++){
                if(it == iter){
                    i--;
                    continue;
                }
                buf[i] = *it;
                Nmax = i + 1;
            }
            delete[] array_;
            array_ = new T[array_size_];
            for (int i = 0; i < Nmax; i++)
                array_[i] = buf[i];
            head_ = 0;
            tail_ = Nmax + 1;
            contents_size_ = Nmax;
            delete[] buf;
        }
    }
    
    T& operator[](const size_t& i) const{
        return array_[(head_ + i) % array_size_];
    }
private:
    T       *array_;
    size_t  array_size_;
    size_t  head_;
    size_t  tail_;
    size_t  contents_size_;
};

int main(){
    circular_buffer<int> buf(5);
    buf.push_back(-1);
    buf.push_back(2);
    buf.push_back(4);
    buf.push_front(31);
    buf.push_back(-77);
    buf.push_back(-7);
    buf.push_front(30);
    buf.pop_back();
    buf.pop_front();
    buf.resize(6);
    buf.push_back(3105);
    buf.push_back(-1);
    buf.push_back(2);
    buf.push_back(4);
    buf.pop_back();
    for (int i = 0; i < buf.size(); i++)
        std::cout << buf[i] << " ";
    circular_buffer<int>::iterator ind = buf.index(3);
    std::cout << "\nIterating by iterator index\n";
    while (ind != buf.end()){
        std::cout << "  value " << *ind << "\n";
        ++ind;
    }
    std::cout << "Head " << buf.front() << ", Tail " << buf.back() << "\n";
    std::cout << "Ring buffer empty " << buf.empty() << ", buffer size " << buf.size() << "\n";
    std::cout << "Capacity " << buf.capacity() << " Max size capacity " << buf.max_size() << "\n";
    std::cout << "After sort method from stl algorithm\n";
    sort(buf.begin(), buf.end());
    for (int i = 0; i < buf.size(); i++)
        std::cout << buf[i] << " ";
    circular_buffer<int>::iterator i = buf.begin() + 1;
    buf.push_it(i, 2020);
    buf.push_it(i + 1, 2021);
    std::cout<<"\n";
    for (int i = 0; i < buf.size(); i++)
        std::cout << buf[i] << " ";
    std::cout << "\nHead " << buf.front() << ", Tail " << buf.back() << "\n";
    std::cout << "Ring buffer empty " << buf.empty() << ", buffer size " << buf.size() << "\n";
    std::cout << "Capacity " << buf.capacity() << " Max size capacity " << buf.max_size() << "\n";
    buf.pop_it(i + 1);
    buf.pop_it(i);
    for (int i = 0; i < buf.size(); i++)
        std::cout << buf[i] << " ";
    std::cout << "\nHead " << buf.front() << ", Tail " << buf.back() << "\n";
    std::cout << "Ring buffer empty " << buf.empty() << ", buffer size " << buf.size() << "\n";
    std::cout << "Capacity " << buf.capacity() << " Max size capacity " << buf.max_size() << "\n";
    return 0;
}

