package com.tzmb2c.web.push.ios;

import com.tzmb2c.web.push.IOSNotification;

public class IOSBroadcast extends IOSNotification {
  public IOSBroadcast() {
    try {
      this.setPredefinedKeyValue("type", "broadcast");
    } catch (Exception ex) {
      ex.printStackTrace();
      System.exit(1);
    }
  }
}
