/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.pojo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Duong Hoang
 */
@Entity
@Table(name = "cuahang-owner")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CuahangOwner.findAll", query = "SELECT c FROM CuahangOwner c"),
    @NamedQuery(name = "CuahangOwner.findByIdCuaHangOwner", query = "SELECT c FROM CuahangOwner c WHERE c.idCuaHangOwner = :idCuaHangOwner")})
public class CuahangOwner implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idCuaHang-Owner")
    private Integer idCuaHangOwner;
    @JoinColumn(name = "idCuaHang", referencedColumnName = "id")
    @ManyToOne
    private Cuahang idCuaHang;
    @JoinColumn(name = "idUser", referencedColumnName = "id")
    @ManyToOne
    private User idUser;

    public CuahangOwner() {
    }

    public CuahangOwner(Integer idCuaHangOwner) {
        this.idCuaHangOwner = idCuaHangOwner;
    }

    public Integer getIdCuaHangOwner() {
        return idCuaHangOwner;
    }

    public void setIdCuaHangOwner(Integer idCuaHangOwner) {
        this.idCuaHangOwner = idCuaHangOwner;
    }

    public Cuahang getIdCuaHang() {
        return idCuaHang;
    }

    public void setIdCuaHang(Cuahang idCuaHang) {
        this.idCuaHang = idCuaHang;
    }

    public User getIdUser() {
        return idUser;
    }

    public void setIdUser(User idUser) {
        this.idUser = idUser;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCuaHangOwner != null ? idCuaHangOwner.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CuahangOwner)) {
            return false;
        }
        CuahangOwner other = (CuahangOwner) object;
        if ((this.idCuaHangOwner == null && other.idCuaHangOwner != null) || (this.idCuaHangOwner != null && !this.idCuaHangOwner.equals(other.idCuaHangOwner))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hd.pojo.CuahangOwner[ idCuaHangOwner=" + idCuaHangOwner + " ]";
    }
    
}
