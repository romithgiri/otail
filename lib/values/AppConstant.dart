enum WebUrls{
  LIVE,
  TEST,
  STAGING
}

class AppConstants {
  static final String _TEST_URL = "https://api.covid19india.org/";
  static final String _TEST_URL_ATTACHMENTS = "";

  static final String _LIVE_URL = "";
  static final String _LIVE_URL_ATTACHMENTS = "";

  static final String _STAGING_URL = "";
  static final String _STAGING_URL_ATTACHMENTS = "";

  static String getWebUrl(WebUrls webUrls){
    String url = "";
    switch(webUrls){
      case WebUrls.LIVE:
        url = _LIVE_URL;
        break;
      case WebUrls.TEST:
        url = _TEST_URL;
        break;
      case WebUrls.STAGING:
        url = _STAGING_URL;
        break;
      default:
        url = _LIVE_URL;
        break;
    }
    return url;
  }

  static String getWebUrlAttachments(WebUrls webUrls){
    String url = "";
    switch(webUrls){
      case WebUrls.LIVE:
        url = _LIVE_URL_ATTACHMENTS;
        break;
      case WebUrls.TEST:
        url = _TEST_URL_ATTACHMENTS;
        break;
      case WebUrls.STAGING:
        url = _STAGING_URL_ATTACHMENTS;
        break;
      default:
        url = _LIVE_URL_ATTACHMENTS;
        break;
    }
    return url;
  }
}