package br.infrastructure;

import br.modelo.Cliente;
import br.modelo.ClienteDetalhe;

public class ClienteDAO {
    
    public void cadastrar(Cliente cliente){
        String query = "INSERT INTO CLIENTE("
                + "NOME, CPF, EMAIL, DATA_NASCIMENTO, SENHA) "
                + "VALUES(?, ?, ?, ?, ?)";
        
//        ps.setString(1,cliente.getNome());
//        ps.setString(2,cliente.getCpf());
//        ps.setString(3,cliente.getEmail());
//        ps.setDate(4,cliente.getDataNascimento());
//        ps.setString(5,cliente.getSenha());
        
    }

    public void cadastrarDadosAdicionais(Integer idCliente, ClienteDetalhe cliente){
        String query = "INSERT INTO CLIENTE_SAUDE("
                        + "SEXO, PESO, ALTURA, GORDURA, HABITOS, EXERCICIO, SAUDE) "
                        + "VALUES(?, ?, ?, ?, ?, ?, ?)";

//        ps.setString(1,cliente.getSexo());
//        ps.setFloat(2,cliente.getPeso());
//        ps.setFloat(3,cliente.getAltura());
//        ps.setString(4,cliente.getHabitos());
//        ps.setString(5,cliente.getExercicio());
//        ps.setString(6,cliente.getSaude());
    }
	
	
}
