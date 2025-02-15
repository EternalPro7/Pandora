package web.orderdetail.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.orderdetail.bean.OrderDetailVO;
import web.orderdetail.dao.OrderDetailDAO;

public class OrderDetailDAOImpl implements OrderDetailDAO {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Pandora");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT = "INSERT INTO Order_Detail (Order_No, Package_No, Room_List_No) "
			+ "VALUES (?, ?, ?)";
	
	
	@Override
	public void insert(OrderDetailVO orderDetailVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setInt(1, orderDetailVO.getOrderNo());
			pstmt.setInt(2, orderDetailVO.getPackageNo());
			pstmt.setInt(3, orderDetailVO.getRoomListNo());
			
			pstmt.executeUpdate();
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void update(OrderDetailVO orderDetailVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer orderDetailNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public OrderDetailVO findByPrimaryKey(Integer orderDetailNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderDetailVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}
}
