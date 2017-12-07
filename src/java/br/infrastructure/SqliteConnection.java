/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.infrastructure;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.sqlite.SQLiteConnection;

public class SqliteConnection {
    
    private Connection connection = null;
    
    public SqliteConnection()
    {
        try {
        Class.forName("org.sqlite.JDBC");
            this.connection = DriverManager
                    .getConnection("jdbc:sqlite:C:\\Users\\jeffe\\Documents\\NetBeansProjects\\trabalho-final\\database\\database.db");
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
    
    
    public void connect() {
        
        Connection connection = null;
        ResultSet resultSet = null;
        Statement statement = null;
 
        try {
            Class.forName("org.sqlite.JDBC");
            connection = DriverManager
                    .getConnection("jdbc:sqlite:C:\\Users\\jeffe\\Documents\\NetBeansProjects\\trabalho-final\\database\\database.db");
            statement = connection.createStatement();
            resultSet = statement
                    .executeQuery("SELECT ID FROM CLIENTES");
            
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
            try {
                resultSet.close();
                statement.close();
                connection.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }
}
