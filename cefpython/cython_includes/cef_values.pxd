# Copyright (c) 2012-2013 The CEF Python authors. All rights reserved.
# License: New BSD License.
# Website: http://code.google.com/p/cefpython/

from cef_ptr cimport CefRefPtr
from libcpp cimport bool as cpp_bool
from cef_string cimport CefString
from libcpp.vector cimport vector
from cef_types cimport cef_value_type_t

cdef extern from "include/cef_values.h":
    CefRefPtr[CefDictionaryValue] CefDictionaryValue_Create "CefDictionaryValue::Create"()
    CefRefPtr[CefListValue] CefListValue_Create "CefListValue::Create"()

cdef extern from "include/cef_values.h":
    cdef cppclass CefBinaryValue:
        pass

    cdef cppclass CefDictionaryValue:
        cpp_bool IsValid()
        cpp_bool IsOwned()
        cpp_bool IsReadOnly()
        CefRefPtr[CefDictionaryValue] Copy(cpp_bool exclude_empty_children)
        size_t GetSize()
        cpp_bool Clear()
        cpp_bool HasKey(const CefString& key)
        cpp_bool GetKeys(vector[CefString]& keys)
        cpp_bool Remove(const CefString& key)
        cef_value_type_t GetType(const CefString& key)
        cpp_bool GetBool(const CefString& key)
        int GetInt(const CefString& key)
        double GetDouble(const CefString& key)
        CefString GetString(const CefString& key)
        CefRefPtr[CefBinaryValue] GetBinary(const CefString& key)
        CefRefPtr[CefDictionaryValue] GetDictionary(const CefString& key)
        CefRefPtr[CefListValue] GetList(const CefString& key)
        cpp_bool SetNull(const CefString& key)
        cpp_bool SetBool(const CefString& key, cpp_bool value)
        cpp_bool SetInt(const CefString& key, int value)
        cpp_bool SetDouble(const CefString& key, double value)
        cpp_bool SetString(const CefString& key, const CefString& value)
        cpp_bool SetBinary(const CefString& key, CefRefPtr[CefBinaryValue] value)
        cpp_bool SetDictionary(const CefString& key, CefRefPtr[CefDictionaryValue] value)
        cpp_bool SetList(const CefString& key, CefRefPtr[CefListValue] value)

    cdef cppclass CefListValue:
        cpp_bool IsValid()
        cpp_bool IsOwned()
        cpp_bool IsReadOnly()
        CefRefPtr[CefListValue] Copy()
        cpp_bool SetSize(size_t size)
        size_t GetSize()
        cpp_bool Clear()
        cpp_bool Remove(int index)
        cef_value_type_t GetType(int index)
        cpp_bool GetBool(int index)
        int GetInt(int index)
        double GetDouble(int index)
        CefString GetString(int index)
        CefRefPtr[CefBinaryValue] GetBinary(int index)
        CefRefPtr[CefDictionaryValue] GetDictionary(int index)
        CefRefPtr[CefListValue] GetList(int index)
        cpp_bool SetNull(int index)
        cpp_bool SetBool(int index, cpp_bool value)
        cpp_bool SetInt(int index, int value)
        cpp_bool SetDouble(int index, double value)
        cpp_bool SetString(int index, const CefString& value)
        cpp_bool SetBinary(int index, CefRefPtr[CefBinaryValue] value)
        cpp_bool SetDictionary(int index, CefRefPtr[CefDictionaryValue] value)
        cpp_bool SetList(int index, CefRefPtr[CefListValue] value)