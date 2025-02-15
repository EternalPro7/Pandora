package web.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TestWriteCruisePicture {
	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	public static final String URL = "jdbc:mysql://localhost:3306/Pandora?serverTimezone=Asia/Taipei";
	public static final String USER = "root";
	public static final String PASSWORD = "password";
	private static final String SQL = "UPDATE Cruise_Line SET Cruise_Lines = ?, Cruise_Line_Picture = ? "
			+ "WHERE Cruise_Line_No = ? ";
	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL);
			// 1. setBlob (JDBC 4.0 / JDK 6)
			pstmt.setString(1, "台灣 基隆港-台灣 花蓮港-台灣 基隆港");
			InputStream is = getPictureStream("src/main/webapp/images/cruiseline1.jpg");//相對位置
			pstmt.setBlob(2, is);
			pstmt.setInt(3, 1);
			pstmt.executeUpdate();
			is.close();
			// 2. setBytes
			pstmt.setString(1, "日本 橫濱港-日本 高知港-日本 橫濱港");
			byte[] pic = getPictureByteArray("src/main/webapp/images/cruiseline2.jpg");
			pstmt.setBytes(2, pic);
			pstmt.setInt(3, 2);
			pstmt.executeUpdate();
			// 3. setBinaryStream
			pstmt.setString(1, "紐西蘭 奧克蘭港-紐西蘭 陶蘭加港-紐西蘭 奧克蘭港");
			InputStream is2 = getPictureStream("src/main/webapp/images/cruiseline3.jpg");
			pstmt.setBinaryStream(2, is2);
			pstmt.setInt(3, 3);
			pstmt.executeUpdate();
			is2.close();
			// 4. setBytes
			pstmt.setString(1, "紐西蘭 奧克蘭港-澳洲 杰拉爾頓港-澳洲 伯斯港");
			byte[] pic2 = getPictureByteArray("src/main/webapp/images/cruiseline4.jpg");
			pstmt.setBytes(2, pic2);
			pstmt.setInt(3, 4);
			pstmt.executeUpdate();
			// 5. setBytes
			pstmt.setString(1, "日本 橫濱港-韓國 濟州港-日本 鹿兒島港");
			byte[] pic3 = getPictureByteArray("src/main/webapp/images/cruiseline5.jpg");
			pstmt.setBytes(2, pic3);
			pstmt.setInt(3, 5);
			pstmt.executeUpdate();
			// 6. setBytes
			pstmt.setString(1, "日本 橫濱港-韓國 濟州港-日本 長崎港");
			byte[] pic4 = getPictureByteArray("src/main/webapp/images/cruiseline6.jpg");
			pstmt.setBytes(2, pic4);
			pstmt.setInt(3, 6);
			pstmt.executeUpdate();
			// 7. setBytes
			pstmt.setString(1, "紐西蘭 奧克蘭港-紐西蘭 群島灣港-澳洲 布里斯本港");
			byte[] pic5 = getPictureByteArray("src/main/webapp/images/cruiseline7.jpg");
			pstmt.setBytes(2, pic5);
			pstmt.setInt(3, 7);
			pstmt.executeUpdate();
			// 8. setBytes
			pstmt.setString(1, "澳洲 雪梨港-紐西蘭 陶蘭加港-紐西蘭 奧克蘭港");
			byte[] pic6 = getPictureByteArray("src/main/webapp/images/cruiseline8.jpg");
			pstmt.setBytes(2, pic6);
			pstmt.setInt(3, 8);
			pstmt.executeUpdate();
			// 9. setBytes
			pstmt.setString(1, "紐西蘭 奧克蘭港-紐西蘭 陶蘭加港-紐西蘭 群島灣港");
			byte[] pic7 = getPictureByteArray("src/main/webapp/images/cruiseline9.jpg");
			pstmt.setBytes(2, pic7);
			pstmt.setInt(3, 9);
			pstmt.executeUpdate();
			// 10. setBytes
			pstmt.setString(1, "日本 橫濱港-日本 鹿兒島港-日本 橫濱港");
			byte[] pic8 = getPictureByteArray("src/main/webapp/images/cruiseline10.jpg");
			pstmt.setBytes(2, pic8);
			pstmt.setInt(3, 10);
			pstmt.executeUpdate();
			System.out.println("新增成功");
		} catch (ClassNotFoundException ce) {
			System.out.println(ce);
		} catch (SQLException se) {
			System.out.println(se);
		} catch (IOException ie) {
			System.out.println(ie);
		} finally {
			// 依建立順序關閉資源 (越晚建立越早關閉)
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					System.out.println(se);
				}
			}
		}
	}
	// 使用InputStream資料流方式
	public static InputStream getPictureStream(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		return fis;
	}
	// 使用byte[]方式
	public static byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()];
		fis.read(buffer);
		fis.close();
		return buffer;
	}
}
