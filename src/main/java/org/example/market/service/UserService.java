package org.example.market.service;
import java.sql.SQLException;
import java.util.List;
import javax.security.auth.login.LoginException;
import org.example.market.dao.UserDao;
import org.example.market.domain.Order;
import org.example.market.domain.User;
import org.example.market.exception.RegisterException;

public class UserService {
	private UserDao dao = new UserDao();
	// 注册操作
	public void register(User user) throws RegisterException {
		// 调用dao完成注册操作
		try {
			dao.addUser(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RegisterException("注冊失败");
		}
	}
	// 登录操作
	public User login(String username, String password) throws LoginException {
		try {
			//根据登录时表单输入的用户名和密码，查找用户
			User user = dao.findUserByUsernameAndPassword(username, password);
			if (user != null) {
					return user;
			}
			throw new LoginException("用户名或密码错误");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new LoginException("登录失败");
		}
	}
	public List<User> findAllUser() {
		List<User> users = null;
		try {
			users = dao.findAllUser();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}
	//管理员删除操作
	public void deleteUser(int id) {
			try {
				dao.deleteUser(id);
			} catch (SQLException e) {
				throw new RuntimeException("后台系统删除用户失败！");
			}
	}
}
