package br.infrastructure;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SqliteConnection {
    
    private Connection connection = null;
    
    public SqliteConnection()
    {
        try {
        Class.forName("org.sqlite.JDBC");
            this.connection = DriverManager.getConnection("jdbc:sqlite:" + System.getProperty("user.home") + "/database.db");
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
    }
    
    public Statement createStatement() throws SQLException
    {
        return connection.createStatement();
    }
    
    public PreparedStatement prepareStatement(String sql) throws SQLException
    {
        return connection.prepareStatement(sql);
    }
    
    public void close() throws SQLException
    {
        connection.close();
    }
}
