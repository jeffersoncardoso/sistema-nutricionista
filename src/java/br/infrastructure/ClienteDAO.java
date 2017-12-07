package br.infrastructure;

import br.modelo.Cliente;
import br.modelo.ClienteDetalhe;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ClienteDAO extends DAO{
    
    public void cadastrar(Cliente cliente){
        String sql = "INSERT INTO CLIENTES("
                + "NOME, CPF, EMAIL, DATA_NASCIMENTO, SENHA) "
                + "VALUES(?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = this.conexao.prepareStatement(sql);
            ps.setString(1,cliente.getNome());
            ps.setString(2,cliente.getCpf());
            ps.setString(3,cliente.getEmail());
            ps.setDate(4,(Date)cliente.getDataNascimento());
            ps.setString(5,cliente.getSenha());
            
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        }
    }
    
    public Cliente buscarPorEmail(String email){
        try{
            PreparedStatement ps = this.conexao.prepareStatement("SELECT * FROM CLIENTES WHERE EMAIL = ?");
            ps.setString(1, email);
            
            ResultSet result = ps.executeQuery();

            ArrayList<Cliente> clientes = this.mapearClientes(result);

            return (clientes.isEmpty()) ? null : clientes.get(0);
        } catch (SQLException ex) {
            throw new RuntimeException("Ocorreu um erro ao buscar");
        }
    }
    
    public Cliente buscarPorId(Integer id){
        try{
            PreparedStatement ps = this.conexao.prepareStatement("SELECT * FROM CLIENTES WHERE ID = ?");
            ps.setInt(1, id);
            
            ResultSet result = ps.executeQuery();

            ArrayList<Cliente> clientes = this.mapearClientes(result);

            return (clientes.isEmpty()) ? null : clientes.get(0);
        } catch (SQLException ex) {
            throw new RuntimeException("Ocorreu um erro ao buscar");
        }
    }
    
    public ArrayList<Cliente> listar()
    {
        ResultSet result = this.select("SELECT * FROM CLIENTES C JOIN "
                + "(SELECT ID_CLIENTE, MAX(DT_CADASTRO) FROM CLIENTE_DETALHE) CD ON(C.ID = CD.ID_CLIENTE)");
        return this.mapearClientes(result);
    }
    
    private ArrayList<Cliente> mapearClientes(ResultSet result)
    {   
        ArrayList<Cliente> clientes = new ArrayList();
        
        try {
            while (result.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(result.getInt("id"));
                cliente.setNome(result.getString("nome"));
                cliente.setCpf(result.getString("cpf"));
                cliente.setEmail(result.getString("email"));
                cliente.setDataNascimento(result.getDate("data_nascimento"));
                cliente.setSenha(result.getString("senha"));
                
                clientes.add(cliente);
            }
            
            result.close();
            return clientes;
        } catch (SQLException ex) {
            throw new RuntimeException("Ocorreu um erro ao buscar os clientes");
        }
    }
    
    private ClienteDetalhe mapearDadosAdicionais(ResultSet result)
    {   
        ArrayList<ClienteDetalhe> clientes = new ArrayList();
        
        try {
            while (result.next()) {
                ClienteDetalhe cliente = new ClienteDetalhe();
                cliente.setId(result.getInt("id_cliente"));
                cliente.setSexo(result.getString("sexo"));
                cliente.setAltura(result.getFloat("altura"));
                cliente.setPeso(result.getFloat("peso"));
                cliente.setGordura(result.getFloat("gordura"));
                cliente.setSaude(result.getString("saude"));
                cliente.setExercicio(result.getString("exercicio"));
                cliente.setHabitos(result.getString("habitos"));
                
                clientes.add(cliente);
            }
            
            result.close();
            
            return (clientes.isEmpty()) ? null : clientes.get(0);
        } catch (SQLException ex) {
            throw new RuntimeException("Ocorreu um erro ao buscar os dados adicionais");
        }
    }

    public void cadastrarDadosAdicionais(Integer idCliente, ClienteDetalhe cliente){
        try {
            String sql = "INSERT INTO CLIENTE_DETALHE("
                    + "DT_CADASTRO, ID_CLIENTE, SEXO, PESO, ALTURA, GORDURA, HABITOS, EXERCICIO, SAUDE) "
                    + "VALUES(DATETIME('NOW'), ?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement ps = this.conexao.prepareStatement(sql);
            ps.setInt(1, idCliente);
            ps.setString(2,cliente.getSexo());
            ps.setFloat(3,cliente.getPeso());
            ps.setFloat(4,cliente.getAltura());
            ps.setFloat(5,cliente.getGordura());
            ps.setString(6,cliente.getHabitos());
            ps.setString(7,cliente.getExercicio());
            ps.setString(8,cliente.getSaude());
            ps.execute();
            
        } catch (SQLException ex) {
            throw new RuntimeException("Ocorreu um erro ao cadastrar os dados adicionais");
        }
    }
    
    public ClienteDetalhe buscarDadosAdicionais(Cliente cliente)
    {
        try{
            PreparedStatement ps = this.conexao.prepareStatement(
            "SELECT * FROM CLIENTE_DETALHE WHERE ID_CLIENTE = ? AND DT_CADASTRO = (SELECT MAX(DT_CADASTRO) FROM CLIENTE_DETALHE WHERE ID_CLIENTE = ?)"
            );
            ps.setInt(1, cliente.getId());
            ps.setInt(2, cliente.getId());
            
            ResultSet result = ps.executeQuery();

            return this.mapearDadosAdicionais(result);
        } catch (SQLException ex) {
            throw new RuntimeException("Ocorreu um erro ao buscar");
        }
    }
	
	
}
