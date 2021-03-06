package com.tzmb2c.web.service;

import java.sql.SQLException;
import java.util.List;

import com.tzmb2c.web.pojo.HelpTypePojo;

public interface HelpTypeService {

  public int getHelpTypeCount(Long pid) throws SQLException;

  public List<HelpTypePojo> getHelpTypeByPid(Long pid) throws SQLException;

  public List<HelpTypePojo> getHelpTypeByPidAndStatus(HelpTypePojo helpTypePojo)
      throws SQLException;

  public HelpTypePojo findHelpType(HelpTypePojo helpTypePojo) throws SQLException;

  public void addHelpType(HelpTypePojo helpType) throws SQLException;

  public void helpTypeUpdate(HelpTypePojo helpType) throws SQLException;

  public void deleHelpType(Long id) throws SQLException;

  public void checkHelpType(Long id) throws SQLException;

  public void checkAllById(String[] tids);

}
