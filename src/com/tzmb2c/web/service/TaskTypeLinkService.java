package com.tzmb2c.web.service;

import java.sql.SQLException;
import java.util.List;

import com.tzmb2c.web.pojo.TaskTypeLinkPojo;

public interface TaskTypeLinkService {

  /**
   * 任务类型
   * 
   * @param taskTypeLinkPojo 任务类型连接Pojo
   * @return 相对应的类型
   * @throws SQLException
   */
  List<TaskTypeLinkPojo> findTaskTypeLinkByTaskType(Long ageId) throws SQLException;

}
