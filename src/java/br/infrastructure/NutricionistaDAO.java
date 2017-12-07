package br.infrastructure;

import br.modelo.Nutricionista;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NutricionistaDAO extends DAO{
    public Nutricionista buscarPorEmail(String email)
    {
        try{
            PreparedStatement ps = this.conexao.prepareStatement("SELECT * FROM NUTRICIONISTAS WHERE EMAIL = ?");
            ps.setString(1, email);
            
            ResultSet result = ps.executeQuery();

            ArrayList<Nutricionista> nutricionistas = this.mapearNutricionistas(result);

            return (nutricionistas.isEmpty()) ? null : nutricionistas.get(0);
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        }
    }
    
    public ArrayList<Nutricionista> mapearNutricionistas(ResultSet result)
    {
        ArrayList<Nutricionista> nutricionistas = new ArrayList();
        
        try {
            while (result.next()) {
                Nutricionista nutricionista = new Nutricionista();
                nutricionista.setId(result.getInt("id"));
                nutricionista.setNome(result.getString("nome"));
                nutricionista.setEmail(result.getString("email"));
                nutricionista.setSenha(result.getString("senha"));
                
                nutricionistas.add(nutricionista);
            }
            
            result.close();
            return nutricionistas;
        } catch (SQLException ex) {
            throw new RuntimeException("Ocorreu um erro ao buscar os clientes");
        }
    }
}
