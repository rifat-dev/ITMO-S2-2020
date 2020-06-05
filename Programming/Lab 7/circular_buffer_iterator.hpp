//
//  circular_buffer_iterator.hpp
//  Ring buffer
//
//  Created by Rifat on 03.06.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef circular_buffer_iterator_hpp
#define circular_buffer_iterator_hpp

#include <iterator>

template <typename T,
          typename T_nonconst,
          typename elem_type = typename T::value_type>
class circular_buffer_iterator{
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

        circular_buffer_iterator
           (const circular_buffer_iterator<T_nonconst, T_nonconst,
                                           typename T_nonconst::value_type>
            &other)
            : buf_(other.buf_), pos_(other.pos_) {}
        friend class circular_buffer_iterator<const T, T, const elem_type>;
        elem_type &operator*()  { return (*buf_)[pos_]; }
        elem_type *operator->() { return &(operator*()); }
        self_type &operator++(){
            pos_ += 1;
            return *this;
        }
        self_type operator++(int){
            self_type tmp(*this);
            ++(*this);
            return tmp;
        }
        self_type &operator--(){
            pos_ -= 1;
            return *this;
        }
        self_type operator--(int){
            self_type tmp(*this);
            --(*this);
            return tmp;
        }
        self_type operator+(difference_type n) const{
            self_type tmp(*this);
            tmp.pos_ += n;
            return tmp;
        }
        self_type &operator+=(difference_type n){
            pos_ += n;
            return *this;
        }
        self_type operator-(difference_type n) const{
            self_type tmp(*this);
            tmp.pos_ -= n;
            return tmp;
        }
        self_type &operator-=(difference_type n){
            pos_ -= n;
            return *this;
        }
        difference_type operator-(const self_type &c) const{
            return pos_ - c.pos_;
        }
        bool operator==(const self_type &other) const{
            return pos_ == other.pos_ && buf_ == other.buf_;
        }
        bool operator!=(const self_type &other) const{
            return pos_ != other.pos_ && buf_ == other.buf_;
        }
        bool operator>(const self_type &other) const{
            return pos_ > other.pos_;
        }
        bool operator>=(const self_type &other) const{
            return pos_ >= other.pos_;
        }
        bool operator<(const self_type &other) const{
            return pos_ < other.pos_;
        }
        bool operator<=(const self_type &other) const{
            return pos_ <= other.pos_;
        }

    private:
        cbuf_type *buf_;
        size_type  pos_;
};

template <typename circular_buffer_iterator_t>
circular_buffer_iterator_t operator+
    (const typename circular_buffer_iterator_t::difference_type &a,
     const circular_buffer_iterator_t                           &b){
    return circular_buffer_iterator_t(a) + b;
}

template <typename circular_buffer_iterator_t>
circular_buffer_iterator_t operator-
    (const typename circular_buffer_iterator_t::difference_type &a,
     const circular_buffer_iterator_t                           &b){
    return circular_buffer_iterator_t(a) - b;
}

#endif /* circular_buffer_iterator_hpp */
