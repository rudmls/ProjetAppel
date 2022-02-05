package com.example.projetappel.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class FicheAppel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private boolean validee = false;

    @OneToMany(
            mappedBy = "ficheAppel",
            cascade = CascadeType.ALL,
            fetch = FetchType.EAGER
    )
    private Set<Presence> presences = new HashSet<>();

    @OneToMany(
            mappedBy = "ficheAppel",
            cascade = CascadeType.ALL,
            fetch = FetchType.EAGER
    )
    private Set<Absence> absences = new HashSet<>();

    @OneToOne(mappedBy = "ficheAppel")
    private CoursInstance coursInstance;

    public FicheAppel() {}

}