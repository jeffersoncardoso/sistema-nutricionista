package br.infrastructure;

import br.modelo.Cliente;
import br.modelo.Dieta;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class DietaDAO extends DAO{
    
    public void cadastrar(Dieta dieta, Integer idCliente, Integer idNutricionista){
        String sql = "INSERT INTO DIETA("
                + "DT_CADASTRO, ID_CLIENTE, ID_NUTRICIONISTA, "
                + "SEGUNDA, TERCA, QUARTA, QUINTA, SEXTA, SABADO, DOMINGO) "
                + "VALUES(DATETIME('NOW'),?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = this.conexao.prepareStatement(sql);
            ps.setInt(1, idCliente);
            ps.setInt(2, idNutricionista);
            ps.setString(3,dieta.getSegunda());
            ps.setString(4,dieta.getTerca());
            ps.setString(5,dieta.getQuarta());
            ps.setString(6,dieta.getQuinta());
            ps.setString(7,dieta.getSexta());
            ps.setString(8,dieta.getSabado());
            ps.setString(9,dieta.getDomingo());
            
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        }
    }
    
    public Dieta buscarUltimaDieta(Cliente cliente)
    {
        String sql = "SELECT * FROM DIETA WHERE DT_CADASTRO = (SELECT MAX(DT_CADASTRO) FROM DIETA WHERE ID_CLIENTE = "+ cliente.getId() +") AND ID_CLIENTE = " + cliente.getId();
        
        ResultSet result = this.select(sql);
        ArrayList<Dieta> dietas = this.mapearDietas(result);
        
        return (dietas.isEmpty()) ? null : dietas.get(0);
    }
    
    
    private ArrayList<Dieta> mapearDietas(ResultSet result)
    {   
        ArrayList<Dieta> dietas = new ArrayList();
        
        try {
            while (result.next()) {
                Dieta dieta = new Dieta();
                dieta.setDataCadastro(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(result.getString("dt_cadastro")));
                dieta.setSegunda(result.getString("segunda"));
                dieta.setTerca(result.getString("terca"));
                dieta.setQuarta(result.getString("quarta"));
                dieta.setQuinta(result.getString("quinta"));
                dieta.setSexta(result.getString("sexta"));
                dieta.setSabado(result.getString("sabado"));
                dieta.setDomingo(result.getString("domingo"));
                
                dietas.add(dieta);
            }
            
            result.close();
            return dietas;
        } catch (Exception ex) {
            throw new RuntimeException(ex.getMessage());
        }
    }
	
}
