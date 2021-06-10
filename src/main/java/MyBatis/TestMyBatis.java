package MyBatis;

import MyBatis.entity.Role;
import MyBatis.entity.User;
import MyBatis.mapper.RoleMapper;
import MyBatis.mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TestMyBatis {

    public static void main(String[] args) {

        //Logger log = LoggerFactory.getLogger(TestMyBatis.class);
        final Logger logger = LoggerFactory.getLogger(TestMyBatis.class);

        SqlSession sqlSession = null;

        try {

            sqlSession = SqlSessionFactoryUtils.openSqlSession();

            //测试 Role 的过程
            RoleMapper roleMapper = sqlSession.getMapper(RoleMapper.class);
            Role role = roleMapper.getRole(1L);
            logger.info(role.getRoleName());
            System.out.println(role.getRoleName() + "过程结束!");

            //测试 User 的过程
//            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
//            User user = userMapper.getUser(1L);
//            logger.info(user.getUserName());
//            System.out.println(user.getUserName() + "过程结束!");


        } catch (Exception e) {
            throw (e);

        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

}
