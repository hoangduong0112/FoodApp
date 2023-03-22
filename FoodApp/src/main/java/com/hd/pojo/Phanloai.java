/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.pojo;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Duong Hoang
 */
@Entity
@Table(name = "phanloai")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Phanloai.findAll", query = "SELECT p FROM Phanloai p"),
    @NamedQuery(name = "Phanloai.findById", query = "SELECT p FROM Phanloai p WHERE p.id = :id"),
    @NamedQuery(name = "Phanloai.findByTen", query = "SELECT p FROM Phanloai p WHERE p.ten = :ten")})
public class Phanloai implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 30)
    @Column(name = "ten")
    private String ten;
    @ManyToMany(mappedBy = "phanloaiSet")
    private Set<Cuahang> cuahangSet;

    public Phanloai() {
    }

    public Phanloai(int id, String a) {
        this.id = id;
        this.ten = a;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    @XmlTransient
    public Set<Cuahang> getCuahangSet() {
        return cuahangSet;
    }

    public void setCuahangSet(Set<Cuahang> cuahangSet) {
        this.cuahangSet = cuahangSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Phanloai)) {
            return false;
        }
        Phanloai other = (Phanloai) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hd.pojo.Phanloai[ id=" + id + " ]";
    }
    
}
