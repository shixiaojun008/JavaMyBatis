package MyBatis.mapper;

// import org.apache.ibatis.annotations.Param;

import MyBatis.entity.CountRoleParams;
import MyBatis.entity.PageParams;
import MyBatis.entity.Role;
import MyBatis.entity.RoleParams;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface RoleMapper {

    public int insertRole(Role role);

    public int deleteRole(Long id);

    public int updateRole(Role role);

    public Role getRole(Long id);

    public List<Role> findRoles(String roleName);

    public List<Role> findRolesByParams(@Param("params") RoleParams roleParams, @Param("page") PageParams pageParams, RowBounds rowBounds);

    public void countRole(CountRoleParams countRoleParams);

}
