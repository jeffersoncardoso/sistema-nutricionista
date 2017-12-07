package br.modelo;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

public class Cliente implements Serializable{
    private Integer id;
    private String nome;
    private String cpf;
    private String email;
    private Date dataNascimento;
    private String senha;
    private ClienteDetalhe detalhes;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }
    
    public Integer getIdade() {
        if(this.getDataNascimento() == null) return null;
        
        Calendar dataNasc = Calendar.getInstance();  
        dataNasc.setTime(this.getDataNascimento()); 
        System.out.println(dataNasc);
        Calendar hoje = Calendar.getInstance();  

        int idade = hoje.get(Calendar.YEAR) - dataNasc.get(Calendar.YEAR); 

        if (hoje.get(Calendar.MONTH) < dataNasc.get(Calendar.MONTH)) {
          idade--;  
        } 
        else 
        { 
            if (hoje.get(Calendar.MONTH) == dataNasc.get(Calendar.MONTH) && hoje.get(Calendar.DAY_OF_MONTH) < dataNasc.get(Calendar.DAY_OF_MONTH)) {
                idade--; 
            }
        }

        return idade;
    }

    public String getSenha() {
        return senha;
    }
    
    public boolean validarSenha(String senha) {
        return this.getSenha().equals(senha);
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public ClienteDetalhe getDetalhes() {
        return detalhes;
    }

    public void setDetalhes(ClienteDetalhe detalhes) {
        this.detalhes = detalhes;
    }
    
    
}
