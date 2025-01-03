package org.example.market.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.example.market.domain.Order;
import org.example.market.domain.User;
import org.example.market.utils.DataSourceUtils;
/**
 * 订单
 * @author admin
 *
 */
public class OrderDao {
	/**
	 *  生成订单
	 * @param order
	 * @throws SQLException
	 */

	public void addProduct(Order order) throws SQLException {
		// 1. 生成Sql语句，添加ordertime字段
		String sql = "INSERT INTO orders (id, money, receiverAddress, receiverName, receiverPhone, paystate, ordertime, user_id) VALUES (?, ?, ?, ?, ?, 0, ?, ?)";

		// 2. 生成执行sql语句的QueryRunner
		QueryRunner runner = new QueryRunner();

		Date ordertime = new Date();

		// 4. 执行update()方法插入数据，包括ordertime
		runner.update(DataSourceUtils.getConnection(), sql,
				order.getId(),
				order.getMoney(),
				order.getReceiverAddress(),
				order.getReceiverName(),
				order.getReceiverPhone(),
				ordertime,
				order.getUser().getId());
	}

	/**
	 * 查找用户所属订单
	 */
	public List<Order> findOrderByUser(final User user) throws SQLException {
		String sql = "select * from orders where user_id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, rs -> {
            List<Order> orders = new ArrayList<Order>();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getString("id"));
                order.setMoney(rs.getDouble("money"));
                order.setOrdertime(rs.getDate("ordertime"));
                order.setPaystate(rs.getInt("paystate"));
                order.setReceiverAddress(rs.getString("receiverAddress"));
                order.setReceiverName(rs.getString("receiverName"));
                order.setReceiverPhone(rs.getString("receiverPhone"));
                order.setUser(user);
                orders.add(order);
            }
            return orders;
        }, user.getId());
	}
	/**
	 * 根据id查找订单信息
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public Order findOrderById(String id) throws SQLException {
		String sql = "select * from orders,user where orders.user_id=user.id and orders.id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, rs -> {
            Order order = new Order();
            while (rs.next()) {
                order.setId(rs.getString("orders.id"));
                order.setMoney(rs.getDouble("orders.money"));
                order.setOrdertime(rs.getDate("orders.ordertime"));
                order.setPaystate(rs.getInt("orders.paystate"));
                order.setReceiverAddress(rs.getString("orders.receiverAddress"));
                order.setReceiverName(rs.getString("orders.receiverName"));
                order.setReceiverPhone(rs.getString("orders.receiverPhone"));

                User user = new User();
                user.setId(rs.getInt("user.id"));
                user.setEmail(rs.getString("user.email"));
                user.setGender(rs.getString("user.gender"));
                user.setIntroduce(rs.getString("user.introduce"));
                user.setPassword(rs.getString("user.password"));
                user.setRegistTime(rs.getDate("user.registtime"));
                user.setRole(rs.getString("user.role"));
                user.setTelephone(rs.getString("user.telephone"));
                user.setUsername(rs.getString("user.username"));
                order.setUser(user);
            }
            return order;
        }, id);
	}
	/**
	 *  查找所有订单
	 * @return
	 * @throws SQLException
	 */
	public List<Order> findAllOrder() throws SQLException {
		//1.创建sql
		String sql = "select orders.*,user.* from orders,user where user.id=orders.user_id order by orders.user_id";
		//2.创建QueryRunner对象
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		//3.返回QueryRunner对象query()方法的查询结果
		return runner.query(sql, rs -> {
            //创建订单集合
            List<Order> orders = new ArrayList<Order>();
            //循环遍历订单和用户信息
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getString("orders.id"));
                order.setMoney(rs.getDouble("orders.money"));
                order.setOrdertime(rs.getDate("orders.ordertime"));
                order.setPaystate(rs.getInt("orders.paystate"));
                order.setReceiverAddress(rs.getString("orders.receiverAddress"));
                order.setReceiverName(rs.getString("orders.receiverName"));
                order.setReceiverPhone(rs.getString("orders.receiverPhone"));
                orders.add(order);

                User user = new User();
                user.setId(rs.getInt("user.id"));
                user.setEmail(rs.getString("user.email"));
                user.setGender(rs.getString("user.gender"));
                user.setIntroduce(rs.getString("user.introduce"));
                user.setPassword(rs.getString("user.password"));
                user.setRegistTime(rs.getDate("user.registtime"));
                user.setRole(rs.getString("user.role"));
                user.setTelephone(rs.getString("user.telephone"));
                user.setUsername(rs.getString("user.username"));
                order.setUser(user);
            }
            return orders;
        });
	}
	/**
	 *  根据订单号修改订单状态
	 * @param id
	 * @throws SQLException
	 */
	public void updateOrderState(String id) throws SQLException {
		String sql = "update orders set paystate=1 where id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		runner.update(sql, id);
		System.out.println(runner.update(sql, id));
	}
	/**
	 *  多条件查询
	 * @param id
	 * @param receiverName
	 * @return
	 * @throws SQLException
	 */
	public List<Order> findOrderByManyCondition(String id, String receiverName)
			throws SQLException {
		//1.创建集合对象
		List<Object> objs = new ArrayList<Object>();
		//2.定义查询sql
		String sql = "select orders.*,user.* from orders,user where user.id=orders.user_id ";
		//3.根据参数拼接sql语句
		if (id != null && id.trim().length() > 0) {
			sql += " and orders.id=?";
			objs.add(id);
		}
		if (receiverName != null && receiverName.trim().length() > 0) {
			sql += " and receiverName=?";
			objs.add(receiverName);
		}
		sql += " order by orders.user_id";
		//4.创建QueryRunner对象
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		//5.返回QueryRunner对象query方法的执行结果
		return runner.query(sql, rs -> {
            List<Order> orders = new ArrayList<>();
            //循环遍历出订单和用户信息
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getString("orders.id"));
                order.setMoney(rs.getDouble("orders.money"));
                order.setOrdertime(rs.getDate("orders.ordertime"));
                order.setPaystate(rs.getInt("orders.paystate"));
                order.setReceiverAddress(rs
                        .getString("orders.receiverAddress"));
                order.setReceiverName(rs.getString("orders.receiverName"));
                order.setReceiverPhone(rs.getString("orders.receiverPhone"));
                orders.add(order);
                User user = new User();
                user.setId(rs.getInt("user.id"));
                user.setEmail(rs.getString("user.email"));
                user.setGender(rs.getString("user.gender"));
                user.setIntroduce(rs.getString("user.introduce"));
                user.setPassword(rs.getString("user.password"));
                user.setRegistTime(rs.getDate("user.registtime"));
                user.setRole(rs.getString("user.role"));
                user.setTelephone(rs.getString("user.telephone"));
                user.setUsername(rs.getString("user.username"));
                order.setUser(user);

            }

            return orders;
        }, objs.toArray());
	}
	/**
	 * 根据id删除订单
	 * @param id
	 * @throws SQLException
	 */
	public void delOrderById(String id) throws SQLException {
		String sql="delete from orders where id=?";
		QueryRunner runner = new QueryRunner();
		runner.update(DataSourceUtils.getConnection(),sql,id);
	}
}
