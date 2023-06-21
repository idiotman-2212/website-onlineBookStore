package ptithcm.dao;

import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class AstractDao {
	protected JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		if (jdbcTemplate == null) {
			DriverManagerDataSource dataSource = new DriverManagerDataSource();
			dataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			dataSource.setUrl("jdbc:sqlserver://DUONGPHI:1433;databaseName=BookStore;encrypt=false;sslProtocol=TLSv1.2");
			dataSource.setUsername("sa");
			dataSource.setPassword("sa2016");
			try {
                Connection conn = dataSource.getConnection();
                System.out.println("KẾT NỐI THÀNH CÔNG");
                conn.close();
            } catch (SQLException e) {
                System.out.println("KẾT NỐI THẤT BẠI");
                e.printStackTrace();
            }
			
			jdbcTemplate= new JdbcTemplate(dataSource);
		}
		return jdbcTemplate; 
	}
}