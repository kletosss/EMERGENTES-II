
package com.emergentes.modelo;

public class Libro {
    private int id;
    private String titulo;
    private String autor;
    private String disponibilidad;
    private Categoria cate;

    public Libro() {
    }

    public Libro(int id, String titulo, String autor, String disponibilidad, Categoria cate) {
        this.id = id;
        this.titulo = titulo;
        this.autor = autor;
        this.disponibilidad = disponibilidad;
        this.cate = cate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getDisponibilidad() {
        return disponibilidad;
    }

    public void setDisponibilidad(String disponibilidad) {
        this.disponibilidad = disponibilidad;
    }

    public Categoria getCate() {
        return cate;
    }

    public void setCate(Categoria cate) {
        this.cate = cate;
    }
    
    
}
