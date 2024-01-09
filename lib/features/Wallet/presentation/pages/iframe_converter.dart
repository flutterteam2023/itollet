String iframeConverter({required String defaultIFrameValue}) {
  return defaultIFrameValue
      .replaceAll("width: 100%", "width: 100%")
      .replaceAll("<iframe", """<iframe width:"320px" """).replaceAll("<head>",
          "<head><meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />");
}
