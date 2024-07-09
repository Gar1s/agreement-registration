package com.eddev.constant;

public enum PracticeType {
    STUDY("Навчальна"),
    MANUFACTURE("Виробнича"),
    TECHNOLOGICAL("Навчально-технологічна"),
    PRE_DIPLOMA("Переддипломна");

    public final String label;

    PracticeType(String label){
        this.label = label;
    }

}
