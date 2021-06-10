package MyBatis.test;

import MyBatis.entity.PageParams;
import MyBatis.entity.Role;
import MyBatis.entity.RoleParams;
import MyBatis.mapper.RoleMapper;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

import MyBatis.entity.*;
import MyBatis.mapper.EmployeeMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TestEmployeeMapper {

    final Logger logger = LoggerFactory.getLogger(TestEmployeeMapper.class);

    public void testEmployeeMapperGet(SqlSession sqlSession) {

        EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);

        Employee employee = employeeMapper.getEmployee(1l);

        //logger.info(employee.getMobile());


    }
}
