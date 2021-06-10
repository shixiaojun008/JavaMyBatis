package MyBatis.test;

import MyBatis.entity.*;
import MyBatis.mapper.*;
import MyBatis.utils.SqlSessionFactoryUtils;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

public class TestMyBatis {

    public static void main(String[] args) {

        //Logger log = LoggerFactory.getLogger(TestMyBatis.class);
        final Logger logger = LoggerFactory.getLogger(TestMyBatis.class);

        SqlSession sqlSession = null;

        try {

            sqlSession = SqlSessionFactoryUtils.openSqlSession();

            //测试 Role 的过程
            //TestRoleMapper testRoleMapper = new TestRoleMapper();

            //测试 Role的查询
            //testRoleMapper.testRoleMapperGet(sqlSession);

            // 测试 Role 的插入
            //testRoleMapper.testRoleMapperIntert(sqlSession);

            //测试 Employee 的过程
            TestEmployeeMapper testEmployeeMapper = new TestEmployeeMapper();
            testEmployeeMapper.testEmployeeMapperGet(sqlSession);



        } catch (Exception e) {
            throw (e);

        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }



}
