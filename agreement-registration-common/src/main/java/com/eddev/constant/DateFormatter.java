package com.eddev.constant;

import java.time.format.DateTimeFormatter;

public class DateFormatter {

    public final static String DATE_FORMATTER_PATTERN = "dd-MM-yyyy";
    public final static DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern(DATE_FORMATTER_PATTERN);

}
