package web.forum.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.forum.bean.ForumVO;
import web.forum.dao.ForumDAO;

public class ForumDAOImpl implements ForumDAO {
	
	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Pandora");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = 
			"INSERT INTO Forum (Member_ID,Post_Title,Post_Content,Post_Time,Clicks,Status) VALUES (?, ?, ?, ?, ?, ?)";
		private static final String GET_ALL_STMT = 
			"SELECT * FROM forum";
		private static final String GET_ONE_STMT = 
			"SELECT postId,memberId,postTitle,postContent,postTime,clicks,status FROM emp2 where postId = ?";
		private static final String DELETE = 
			"DELETE FROM forum where postId = ?";
		private static final String UPDATE = 
			"UPDATE forum set memberId=?, postTitle=?, postContent=?, postTime=?, clicks=?, status=? where postId = ?";

	
	
	@Override
	public void insert(ForumVO forumVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, forumVO.getMemberId());
			pstmt.setString(2, forumVO.getPostTitle());
			pstmt.setString(3, forumVO.getPostContent());
			pstmt.setTimestamp(4, forumVO.getPostTime() != null ? Timestamp.valueOf(forumVO.getPostTime()) : null);
			pstmt.setInt(5, forumVO.getClicks());
			pstmt.setString(6, forumVO.getStatus());

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
	public void update(ForumVO forumVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, forumVO.getMemberId());
			pstmt.setString(2, forumVO.getPostTitle());
			pstmt.setString(3, forumVO.getPostContent());
			pstmt.setTimestamp(4, forumVO.getPostTime() != null ? Timestamp.valueOf(forumVO.getPostTime()) : null);
			pstmt.setInt(5, forumVO.getClicks());
			pstmt.setString(6, forumVO.getStatus());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
	public void delete(Integer postId) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, postId);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
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
	public ForumVO findByPrimaryKey(Integer postId) {
		
		ForumVO forumVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, postId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				forumVO = new ForumVO();
				forumVO.setPostId(rs.getInt("Post_ID"));
				forumVO.setMemberId(rs.getInt("Member_ID"));
				forumVO.setPostTitle(rs.getString("Post_Title"));
				forumVO.setPostContent(rs.getString("Post_Content"));
				forumVO.setPostTime(rs.getTimestamp("Post_Time").toLocalDateTime());
				forumVO.setClicks(rs.getInt("Clicks"));
				forumVO.setStatus(rs.getString("Status"));
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
		return forumVO;
		
	}

	@Override
	public List<ForumVO> getAll() {
		List<ForumVO> list = new ArrayList<ForumVO>();
		ForumVO forumVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				forumVO = new ForumVO();
				forumVO.setPostId(rs.getInt("Post_ID"));
				forumVO.setMemberId(rs.getInt("Member_ID"));
				forumVO.setPostTitle(rs.getString("Post_Title"));
				forumVO.setPostContent(rs.getString("Post_Content"));
				forumVO.setPostTime(rs.getTimestamp("Post_Time").toLocalDateTime());
				forumVO.setClicks(rs.getInt("Clicks"));
				forumVO.setStatus(rs.getString("Status"));
				list.add(forumVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
		return list;
	}

}
