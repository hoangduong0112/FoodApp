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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Duong Hoang
 */
@Entity
@Table(name = "cuahang")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cuahang.findAll", query = "SELECT c FROM Cuahang c"),
    @NamedQuery(name = "Cuahang.findById", query = "SELECT c FROM Cuahang c WHERE c.id = :id"),
    @NamedQuery(name = "Cuahang.findByTen", query = "SELECT c FROM Cuahang c WHERE c.ten = :ten"),
    @NamedQuery(name = "Cuahang.findByDiaChi", query = "SELECT c FROM Cuahang c WHERE c.diaChi = :diaChi"),
    @NamedQuery(name = "Cuahang.findByMoCua", query = "SELECT c FROM Cuahang c WHERE c.moCua = :moCua"),
    @NamedQuery(name = "Cuahang.findByDanhGia", query = "SELECT c FROM Cuahang c WHERE c.danhGia = :danhGia"),
    @NamedQuery(name = "Cuahang.findByAvatar", query = "SELECT c FROM Cuahang c WHERE c.avatar = :avatar")})
public class Cuahang implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 45)
    @Column(name = "ten")
    private String ten;
    @Size(max = 100)
    @Column(name = "DiaChi")
    private String diaChi;
    @Column(name = "MoCua")
    private Short moCua;
    @Column(name = "DanhGia")
    private Integer danhGia;
    @Size(max = 100)
    @Column(name = "avatar")
    private String avatar;
    @JoinTable(name = "phanloai-cuahang", joinColumns = {
        @JoinColumn(name = "idcuahang", referencedColumnName = "id")}, inverseJoinColumns = {
        @JoinColumn(name = "idphanloai", referencedColumnName = "id")})
    @ManyToMany
    private Set<Phanloai> phanloaiSet;
    @OneToMany(mappedBy = "idCuaHang")
    private Set<CuahangOwner> cuahangOwnerSet;

    public Cuahang() {
    }

    public Cuahang(Integer id) {
        this.id = id;
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

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public Short getMoCua() {
        return moCua;
    }

    public void setMoCua(Short moCua) {
        this.moCua = moCua;
    }

    public Integer getDanhGia() {
        return danhGia;
    }

    public void setDanhGia(Integer danhGia) {
        this.danhGia = danhGia;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @XmlTransient
    public Set<Phanloai> getPhanloaiSet() {
        return phanloaiSet;
    }

    public void setPhanloaiSet(Set<Phanloai> phanloaiSet) {
        this.phanloaiSet = phanloaiSet;
    }

    @XmlTransient
    public Set<CuahangOwner> getCuahangOwnerSet() {
        return cuahangOwnerSet;
    }

    public void setCuahangOwnerSet(Set<CuahangOwner> cuahangOwnerSet) {
        this.cuahangOwnerSet = cuahangOwnerSet;
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
        if (!(object instanceof Cuahang)) {
            return false;
        }
        Cuahang other = (Cuahang) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hd.pojo.Cuahang[ id=" + id + " ]";
    }
    
}
