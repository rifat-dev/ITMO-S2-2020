//
//  circular_buffer.hpp
//  Ring buffer
//
//  Created by Rifat on 03.06.2020.
//  Copyright © 2020 Rifat. All rights reserved.
//

#ifndef circular_buffer_hpp
#define circular_buffer_hpp

#include "circular_buffer_iterator.hpp"

template <typename T>
class circular_buffer{
public:
    typedef circular_buffer<T>self_type;
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
            <const self_type, const value_type>
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
            int cs__ = 0;
            int pos__ = -1;
            int i = 0;
            for (auto it = begin(); static_cast<void>(it != end()), i <= array_size_; it++, i++){
                if (it == iter){
                    pos__ = i;
                    buffer[i] = value;
                    cs__++;
                    i++;
                }
                buffer[i] = *it;
                cs__++;
            }
            delete[] array_;
            array_ = new T[array_size_];
            for (int i = 0; i <= cs__; i++)
                array_[i] = buffer[i];
            head_ = 0;
            tail_ = cs__ - 2;
            contents_size_ = cs__ - 1;
            delete[] buffer;
        }
    }
    void pop_it(iterator iter){
        if (iter == begin())
                { pop_front(); }
        else if (iter == end() - 1)
                { pop_back(); }
        else{
            T* buffer = new T[contents_size_];
            int cs__ = 0;
            int i = 0;
            for (auto it = begin(); it != end(); it++, i++){
                if(it == iter){
                    i--;
                    continue;
                }
                buffer[i] = *it;
                cs__ = i + 1;
            }
            delete[] array_;
            array_ = new T[array_size_];
            for (int i = 0; i < cs__; i++)
                array_[i] = buffer[i];
            head_ = 0;
            tail_ = cs__ + 1;
            contents_size_ = cs__;
            delete[] buffer;
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

#endif /* circular_buffer_hpp */
