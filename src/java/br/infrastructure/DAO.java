package br.infrastructure;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAO {
    protected final SqliteConnection conexao;

    public DAO(){
        this.conexao = new SqliteConnection();
    }
    
    public ResultSet select(String sql){
        Statement statement;
        try {
            statement = this.conexao.createStatement();
            ResultSet result = statement.executeQuery(sql);
            
            return result;
        } catch (SQLException ex) {
            throw new RuntimeException("Erro ao buscar");
        }
    }
    
    public boolean insert(PreparedStatement statement){
        try {
            statement.execute();
            statement.close();
            return true;
        } catch (SQLException ex) {
            throw new RuntimeException("Erro ao inserir");
        }
    }
    
    
}
