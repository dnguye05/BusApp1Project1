      ******************************************************************
      *Author: David Nguyen
      *Date: October 5, 2021
      *Purpose: project1
      ******************************************************************
       IDENTIFICATION DIVISION.
           PROGRAM-ID. project1.
           AUTHOR. David Nguyen.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO 'COB1-EMPLOYEE'
               ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD  INPUT-FILE
           BLOCK CONTAINS 0 RECORDS
               LABEL RECORDS ARE STANDARD.
       01  INPUT-REC PIC X(97).
       WORKING-STORAGE SECTION.
       01  INPUT-DATA.
           03 I-EMPID PIC X(7).
           03 I-LNAME PIC X(15).
           03 I-FNAME PIC X(15).
           03 I-EMPTYPE PIC X(2).
           03 I-TITLE PIC X(17).
           03 I-SSN PIC X(9).
           03 I-EMPTYSPACES PIC X(24).
           03 I-DATE PIC X(8).
       01  PRNT-DATA1.
           03 L-SSN PIC XXXBXXBXXXX.
           03 L-EMPID PIC X(10).
           03 L-LNAME PIC X(20).
           03 L-FNAME PIC X(20).
           03 L-TITLE PIC X(20).
           03 L-EMPTYPE PIC X(10).
           03 L-DATE PIC 99/99/9999.
       01  PRNT-HEADING1.
           03 FILLER PIC X(15) VALUES 'SSN'.
           03 FILLER PIC X(10) VALUES 'EMP ID'.
           03 FILLER PIC X(20) VALUES 'LAST'.
           03 FILLER PIC X(20) VALUES 'FIRST'.
           03 FILLER PIC X(20) VALUES 'TITLE'.
           03 FILLER PIC X(10) VALUES 'TYPE'.
           03 FILLER PIC X(10) VALUES 'DATE'.
       01  MISC.
           03 EOF-I PIC 9 VALUE 0.
       PROCEDURE DIVISION.
       000-MAINLINE.
           OPEN INPUT INPUT-FILE.
           PERFORM 2000-READ-INPUT.
           PERFORM 1400-PRINT-HEADER.
           PERFORM 1500-LOOP
               UNTIL EOF-I = 1;
           CLOSE INPUT-FILE.
           STOP RUN.
       1400-PRINT-HEADER.
           DISPLAY PRNT-HEADING1.
       1500-LOOP.
           PERFORM 1600-PRINT-RECORDS.
           PERFORM 2000-READ-INPUT.
       1600-PRINT-RECORDS.
           MOVE I-EMPID TO L-EMPID.
           MOVE I-LNAME TO L-LNAME.
           MOVE I-FNAME TO L-FNAME.
           MOVE I-EMPTYPE TO L-EMPTYPE.
           MOVE I-TITLE TO L-TITLE.
           MOVE I-SSN TO L-SSN.
               INSPECT L-SSN REPLACING ALL ' ' BY '-'.
           MOVE I-DATE TO L-DATE.
           DISPLAY L-SSN "    " L-EMPID L-LNAME L-FNAME L-TITLE 
               L-EMPTYPE L-DATE.
       2000-READ-INPUT.
           READ INPUT-FILE INTO INPUT-DATA
               AT END MOVE 1 TO EOF-I.
       END PROGRAM project1.
