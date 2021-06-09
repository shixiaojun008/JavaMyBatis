package MyBatis;

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

            RoleMapper roleMapper = sqlSession.getMapper(RoleMapper.class);

            Role role = roleMapper.getRole(1L);

            System.out.println(role.getRoleName());

            logger.info(role.getRoleName());


        } catch (Exception e) {
            throw (e);

        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

}
