

cdef public void DownloadHandler_OnBeforeDownload(
        CefRefPtr[CefBrowser] cefBrowser,
        CefRefPtr[CefDownloadItem] cefDownloadItem,
        const CefString& cefSuggestedName,
        CefRefPtr[CefBeforeDownloadCallback] cefCallback
        ) except * with gil:
    cdef PyBrowser pyBrowser
    cdef PyDownloadItem pyDownloadItem
    cdef str pySuggestedName
    cdef PyBeforeDownloadCallback pyBeforeDownloadCallback
    cdef object callback
    try:
        pyBrowser = GetPyBrowser(cefBrowser, "OnBeforeDownload")
        callback = pyBrowser.GetClientCallback("OnBeforeDownload")
        pyDownloadItem = PyDownloadItem()
        pyDownloadItem.cefDownloadItem = cefDownloadItem
        pySuggestedName = CefToPyString(cefSuggestedName)
        pyBeforeDownloadCallback = PyBeforeDownloadCallback()
        pyBeforeDownloadCallback.cefBeforeDownloadCallback = cefCallback
        if callback:
            callback(browser=pyBrowser, downloadItem=pyDownloadItem, 
                     suggestedName=pySuggestedName, callback=pyBeforeDownloadCallback)
    except:
        (exc_type, exc_value, exc_trace) = sys.exc_info()
        sys.excepthook(exc_type, exc_value, exc_trace)
