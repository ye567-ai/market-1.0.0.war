package org.example.market.dao;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.example.market.domain.Order;
import org.example.market.domain.User;
import org.example.market.utils.DataSourceUtils;

public class UserDao {
	// 添加用户
	public void addUser(User user) throws SQLException {
		String sql = "insert into user(username,password,gender,email,telephone,introduce) values(?,?,?,?,?,?)";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		int row = runner.update(sql, user.getUsername(), user.getPassword(),
				user.getGender(), user.getEmail(), user.getTelephone(),
				user.getIntroduce());
		if (row == 0) {
			throw new RuntimeException();
		}
	}

	//根据用户名与密码查找用户
	public User findUserByUsernameAndPassword(String username, String password) throws SQLException {
		String sql="select * from user where username=? and password=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanHandler<>(User.class),username,password);
	}
	//查找所有普通用户
	public List<User> findAllUser() throws SQLException {
		// 1. 创建sql
		String sql = "SELECT * FROM user WHERE role = '普通用户';";

		// 2. 创建QueryRunner对象
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

		// 3. 返回QueryRunner对象query()方法的查询结果
		return runner.query(sql, rs -> {
			List<User> users = new ArrayList<>();
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id")); // 无需指定表名，直接使用列名
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setIntroduce(rs.getString("introduce"));
				user.setPassword(rs.getString("password"));
				user.setRegistTime(rs.getDate("registTime")); // 确保列名与User类属性名匹配
				user.setRole(rs.getString("role"));
				user.setTelephone(rs.getString("telephone"));
				user.setUsername(rs.getString("username"));
				users.add(user); // 将user对象添加到列表中
			}
			return users;
		});
	}

	public void deleteUser(int id) throws SQLException {
		String sql = "DELETE FROM user WHERE id = ?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		runner.update(sql, id);
	}
}

