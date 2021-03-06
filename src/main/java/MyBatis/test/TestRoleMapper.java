package MyBatis.test;

import MyBatis.entity.CountRoleParams;
import MyBatis.entity.PageParams;
import MyBatis.entity.Role;
import MyBatis.entity.RoleParams;
import MyBatis.mapper.RoleMapper;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Random;

public class TestRoleMapper {

    TestRoleMapper() {

    }

    final Logger logger = LoggerFactory.getLogger(TestRoleMapper.class);

    public void testRoleMapperFindRoles(SqlSession sqlSession) {

        RoleMapper roleMapper = sqlSession.getMapper(RoleMapper.class);

        List<Role> roles = roleMapper.findRoles("name");

        System.out.println("ID" + "\t\t\t" + "role_Name" + "\t\t\t\t" + "role_Note");
        for (Role role : roles) {
            System.out.println(role.getId() + "\t\t\t" + role.getRoleName() + "\t\t\t" + role.getNote());
        }


    }

    public void testRoleMapperGet(SqlSession sqlSession) {

        RoleMapper roleMapper = sqlSession.getMapper(RoleMapper.class);
        //Role role = roleMapper.getRole(1L);
        RoleParams roleParams = new RoleParams("nam", "note");
        PageParams pageParams = new PageParams(0, 100);
        RowBounds rowBounds = new RowBounds(0, 100);
        List<Role> roles = roleMapper.findRolesByParams(roleParams, pageParams, rowBounds);

        System.out.println("ID" + "\t\t\t" + "role_Name" + "\t\t\t\t" + "role_Note");
        for (Role role : roles) {
            System.out.println(role.getId() + "\t\t\t" + role.getRoleName() + "\t\t\t" + role.getNote());
        }

        //logger.info(role.getRoleName());
        //System.out.println(role.getRoleName() + "过程结束!");

        //测试 User 的过程
        //UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        //User user = userMapper.getUser(1L);
        //logger.info(user.getUserName());
        //System.out.println(user.getId() + "\t" + user.getUserName() + "\t\t" +  user.getNote());

    }

    public void testRoleMapperIntert(SqlSession sqlSession) {

        Random random = new Random();
        Role role = new Role();
        String ends = String.format("%02d", random.nextInt(99));
        role.setRoleName("Role_insert_" + ends);
        role.setNote("note_" + ends);
        RoleMapper roleMapper = sqlSession.getMapper(RoleMapper.class);

        int iReturn = roleMapper.insertRole(role);
        sqlSession.commit();
        if (iReturn == 1) {
            System.out.println("插入成功，返回值ID：" + role.getId());
        } else {
            System.out.println("插入失败");
        }

    }

    public void testRoleMapperGetBySP(SqlSession sqlSession) {

        RoleMapper roleMapper = sqlSession.getMapper(RoleMapper.class);

        CountRoleParams countRoleParams = new CountRoleParams();
        countRoleParams.setRoleName("name");
        roleMapper.countRole(countRoleParams);
        System.out.println("返回总数：" + countRoleParams.getTotal() + "\t\t" + "执行时间：" + countRoleParams.getExecDate());


    }


}
