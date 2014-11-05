package com.iteso.sweng.Profile;

/**
 * Created by Daniel on 12/10/14.
 */

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class ProfileTest {

    @Test
    public void PruebaConstructorAndGet() {
        Profile prueba = new Profile();

        assertEquals(null, prueba.getName());
        assertEquals(null, prueba.getLastname());
        assertEquals(null, prueba.getEmail());
        assertEquals(null, prueba.getPassword());
        assertEquals(null, prueba.getPhome());
        assertEquals(null, prueba.getPoffice());
        assertEquals(null, prueba.getPmobile());
        assertEquals(null, prueba.getNick());
        assertEquals(false, prueba.isStatus());

    }



}
