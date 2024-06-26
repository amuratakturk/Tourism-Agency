package dao;

import core.Database;
import entity.Hotel;
import entity.Pension;
import entity.Season;
import entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

// Pension veritabanı işlemlerini yapan sınıf
public class PensionDao {
    private final Connection connection;

    // Yapılandırıcı metot
    public PensionDao() {
        this.connection = Database.getInstance();
    }

    // Belirli bir otel ID'sine sahip Pension getiren metot
    public ArrayList<Pension> getPensionByOtelId(int id) {
        ArrayList<Pension> pensions = new ArrayList<>();
        String query = "SELECT * FROM public.hotel_pension WHERE hotel_id = ?";

        try (PreparedStatement pr = connection.prepareStatement(query)) {
            pr.setInt(1, id);
            ResultSet rs = pr.executeQuery();

            while (rs.next()) {
                Pension pension = match(rs);
                pensions.add(pension);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pensions;
    }

    // Belirli bir ID'ye sahip Pension getiren metot
    public Pension getByID(int id) {
        Pension obj = null;
        String query = "SELECT * FROM public.hotel_pension WHERE id = ? ";
        try {
            PreparedStatement pr = this.connection.prepareStatement(query);
            pr.setInt(1, id);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                obj = this.match(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return obj;
    }

    // ResultSet'ten Pension nesnesine eşleme yapan yardımcı metot
    public Pension match(ResultSet rs) throws SQLException {
        Pension obj = new Pension();
        obj.setId(rs.getInt("id"));
        obj.setHotel_id(rs.getInt("hotel_id"));
        obj.setPension_type(rs.getString("pension_type"));


        return obj;
    }

    // Pension güncelleyen metot-programa daha sonra eklenecek
    public boolean update(Pension pension) {
        try {
            String query = "UPDATE public.hotel_pension SET " +
                    "hotel_id = ?," +
                    "pension_type = ?" +
                    "WHERE user_id = ?";

            PreparedStatement pr = connection.prepareStatement(query);
            pr.setInt(1,pension.getHotel_id());
            pr.setString(2,pension.getPension_type());
            return pr.executeUpdate() != -1;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return true;
    }

    // Tüm pansiyonları getiren metot
    public ArrayList<Pension> findAll() {
        ArrayList<Pension> pensionList = new ArrayList<>();
        String sql = "SELECT * FROM public.hotel_pension";
        try {
            ResultSet rs = this.connection.createStatement().executeQuery(sql);
            while (rs.next()) {

                pensionList.add(this.match(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pensionList;
    }

    // Pansiyon ekleyen metot
    public boolean save(Pension pension){
        String query = "INSERT INTO public.hotel_pension"+
                "("+
                "hotel_id,"+
                "pension_type"+
                ")"+
                "VALUES (?,?)";
        try {
            PreparedStatement pr = connection.prepareStatement(query);
            pr.setInt(1,pension.getHotel_id());
            pr.setString(2,pension.getPension_type());
            return  pr.executeUpdate() != -1;
        } catch (SQLException throwables) {
           throwables.printStackTrace();
        }
        return true;
    }

    // Pansiyon silen metot
    public boolean delete(int hotel_id){
        try{
            String query = "DELETE FROM public.hotel_pension WHERE id = ?";
            PreparedStatement pr = connection.prepareStatement(query);
            pr.setInt(1,hotel_id);
            return pr.executeUpdate() != -1;
        }catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return true;
    }
}