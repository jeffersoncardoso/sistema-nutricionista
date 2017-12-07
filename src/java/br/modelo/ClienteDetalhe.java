package br.modelo;

public class ClienteDetalhe {
    private Integer id;
    private String sexo;
    private Float peso;
    private Float altura;
    private Float gordura;
    private String habitos;
    private String exercicio;
    private String saude;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public Float getPeso() {
        return peso;
    }

    public void setPeso(Float peso) {
        this.peso = peso;
    }

    public Float getAltura() {
        return altura;
    }

    public void setAltura(Float altura) {
        this.altura = altura;
    }

    public Float getGordura() {
        return gordura;
    }

    public void setGordura(Float gordura) {
        this.gordura = gordura;
    }

    public String getHabitos() {
        return habitos.replace(System.getProperty("line.separator"), "");
    }

    public void setHabitos(String habitos) {
        this.habitos = habitos;
    }

    public String getExercicio() {
        return exercicio.replace(System.getProperty("line.separator"), "");
    }

    public void setExercicio(String exercicio) {
        this.exercicio = exercicio;
    }

    public String getSaude() {
        return saude.replace(System.getProperty("line.separator"), "");
    }

    public void setSaude(String saude) {
        this.saude = saude;
    }
    
    
}
