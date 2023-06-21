package ptithcm.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import ptithcm.model.Invoice;

public class InvoiceMapper implements RowMapper<Invoice> {
	@Override
	public Invoice mapRow(ResultSet rs, int numRow) throws SQLException {
		Invoice invoice = new Invoice();
		invoice.setId(rs.getInt("InvoiceId"));
		invoice.setMemberId(rs.getInt("MemberId"));
		invoice.setEmail(rs.getString("Email"));
		invoice.setTel(rs.getString("Tel"));
		invoice.setAddress(rs.getString("Address"));
		invoice.setStatusId(rs.getInt("StatusId"));
		if(rs.getInt("StatusId")==1)
			invoice.setStatus("Đơn hàng đã tiếp nhận");
		else if(rs.getInt("StatusId")==2)
			invoice.setStatus("Đơn hàng đang giao");
		else if(rs.getInt("StatusId")==3)
			invoice.setStatus("Đơn hàng đã giao thành công");
		else if(rs.getInt("StatusId")==4)
			invoice.setStatus("Đơn hàng đã hủy");
		invoice.setDate(rs.getDate("AddedDate"));
		return invoice;
	}
}
