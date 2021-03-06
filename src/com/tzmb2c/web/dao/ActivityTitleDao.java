package com.tzmb2c.web.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.tzmb2c.web.pojo.ActivityTitlePojo;

public interface ActivityTitleDao {
  List<ActivityTitlePojo> findActivityTitleList(Map<String, Object> map) throws SQLException;

  int findActivityTitleCount(Map<String, Object> map) throws SQLException;

  ActivityTitlePojo findActivityTitleById(Long id) throws SQLException;

  void insertActivityTitle(ActivityTitlePojo activityTitle) throws SQLException;

  void delActivityTitle(Long id) throws SQLException;

  void updateActivityTitle(ActivityTitlePojo activityTitle) throws SQLException;

  void checkActivityTitle(Long id) throws SQLException;

  void uncheckActivityTitle(Long id) throws SQLException;

  ActivityTitlePojo getActivityTitleById(Map<String, Object> map) throws SQLException;
}
