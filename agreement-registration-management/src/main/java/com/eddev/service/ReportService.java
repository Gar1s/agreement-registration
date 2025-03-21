package com.eddev.service;

import com.eddev.dto.AgreementDto;
import lombok.RequiredArgsConstructor;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.eddev.constant.DateFormatter.DATE_TIME_FORMATTER;

@Service
@RequiredArgsConstructor
public class ReportService {

    public HSSFWorkbook generateAgreementsExcel(List<AgreementDto> agreements) {
        HSSFWorkbook book = new HSSFWorkbook();
        HSSFSheet sheet = book.createSheet("Угоди");
        HSSFRow row = sheet.createRow(0);

        // Create a cell style for headers
        CellStyle headerCellStyle = book.createCellStyle();
        headerCellStyle.setAlignment(HorizontalAlignment.CENTER);
        headerCellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        Font headerFont = book.createFont();
        headerFont.setBold(true);
        headerCellStyle.setFont(headerFont);
        headerCellStyle.setFillForegroundColor(IndexedColors.LIGHT_YELLOW.getIndex());

        row.createCell(0).setCellValue("#");
        row.createCell(1).setCellValue("Номер угоди");
        row.createCell(2).setCellValue("База практики");
        row.createCell(3).setCellValue("Вид практики");
        row.createCell(4).setCellValue("Дата угоди");
        row.createCell(5).setCellValue("Термін дії");
        row.createCell(6).setCellValue("Ініціали cтудента");
        row.createCell(7).setCellValue("Ініціали керівника");
        for (Cell cell : row) {
            cell.setCellStyle(headerCellStyle);
        }
        int dataRowIndex = 1;
        for (AgreementDto agreement : agreements) {
            HSSFRow dataRow = sheet.createRow(dataRowIndex);
            dataRow.createCell(0).setCellValue(dataRowIndex);
            dataRow.createCell(1).setCellValue(agreement.getNumeration());
            dataRow.createCell(2).setCellValue(agreement.getCompanyName());
            dataRow.createCell(3).setCellValue(agreement.getPracticeType());
            dataRow.createCell(4).setCellValue(agreement.getCompanyAgreementDate().format(DATE_TIME_FORMATTER));
            dataRow.createCell(5).setCellValue(
                    agreement.getStartDate().format(DATE_TIME_FORMATTER) + " - " +
                            agreement.getEndDate().format(DATE_TIME_FORMATTER));
            dataRow.createCell(6).setCellValue(agreement.getStudentInitials());
            dataRow.createCell(7).setCellValue(agreement.getCompanyInitials());
            dataRowIndex++;
        }
        for (int i = 0; i < 8; i++) {
            sheet.autoSizeColumn(i);
        }
        return book;
    }

}
