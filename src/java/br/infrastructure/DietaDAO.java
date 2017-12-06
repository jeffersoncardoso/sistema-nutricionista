package br.infrastructure;

import br.modelo.Dieta;

public class DietaDAO {
    
    public void cadastrar(Dieta dieta, Integer idCliente, Integer idNutricionista){
        String query = "INSERT INTO DIETA("
                + "ID_CLIENTE, ID_NUTRICIONISTA, DT_INICIO, DT_FINAL, "
                + "SEGUNDA, TERCA, QUARTA, QUINTA, SEXTA, SABADO, DOMINGO) "
                + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
//        ps.setInteger(1, idCliente);
//        ps.setInteger(2, idNutricionista);
//        ps.setDate(3,dieta.getDataInicio());
//        ps.setDate(4,dieta.getDataFinal());
//        ps.setString(5,dieta.getSegunda());
//        ps.setString(6,dieta.getTerca());
//        ps.setString(7,dieta.getQuarta());
//        ps.setString(8,dieta.getQuinta());
//        ps.setString(9,dieta.getSexta());
//        ps.setString(10,dieta.getSabado());
//        ps.setString(11,dieta.getDomingo());
    }
	
}
