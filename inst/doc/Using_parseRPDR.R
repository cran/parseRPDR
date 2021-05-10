## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## ----pretty_mrn---------------------------------------------------------------
#  mrns <- sample(1e4:1e7, size = 10) #Simulate MRNs
#  
#  #MGH format
#  pretty_mrn(v = mrns, prefix = "MGH")
#  
#  #BWH format
#  pretty_mrn(v = mrns, prefix = "BWH")
#  
#  #Multiple sources using space as a separator
#  pretty_mrn(v = mrns[1:3], prefix = c("MGH", "BWH", "EMPI"), sep = " ")
#  
#  #Keeping the length of the IDs despite not adhering to the requirements
#  pretty_mrn(v = mrns, prefix = "EMPI", id_length = "asis")

## ----load---------------------------------------------------------------------
#  #Print raw data
#  head(data_mrn_raw)
#  
#  #Print processed data loaded using load_mrn
#  head(data_mrn)

## ----load_con-----------------------------------------------------------------
#  #Print raw data containing columns which are proccessed using the load_con function
#  data_con_raw[, c("MRN_Type", "MRN", "Patient_ID_List")]
#  
#  #Print processed ID data
#  data_con[, grep("ID_.*", colnames(data_con), value = TRUE)]

## ----all_ids_mi2b2------------------------------------------------------------
#  #Initially requested IDs
#  data_con$ID_con_MGH
#  
#  #All MGH MRNs that the patients had anytime during their visits to Partners hospitals
#  #Due to fake sample data it is the same as above
#  all_MGH_mrn <- all_ids_mi2b2(type = "MGH", d_mrn = data_mrn, d_con = data_con)

## ----load_notes---------------------------------------------------------------
#  #Using defaults
#  d_hnp <- load_notes(file = "test_Hnp.txt", type = "hnp")
#  #Use sequential processing
#  d_hnp <- load_notes(file = "test_Hnp.txt", type = "hnp", nThread = 1)
#  #Use parallel processing and parse data in MRN_Type and MRN columns and keep all IDs
#  d_hnp <- load_notes(ile = "test_Hnp.txt", type = "hnp", nThread = 20, mrn_type = TRUE, perc = 1)

## ----load_all-----------------------------------------------------------------
#  #Load all Con, Dem and Mrn datasets processing all files within given datasource in parallel
#  load_all(folder = folder_rpdr, which_data = c("con", "dem", "mrn"), nThread = 2, many_sources = FALSE)
#  
#  #Load all supported file types parallelizing on the level of datasources
#  load_all(folder = folder_rpdr, nThread = 2, many_sources = TRUE)

## ----convert_enc--------------------------------------------------------------
#  #Parse encounter ICD columns and keep original ones as well
#  data_enc_parse <- convert_enc(d = data_enc, keep = TRUE, nThread = 2)
#  
#  #Parse encounter ICD columns and discard original ones, and create indicator variables for the following diseases
#  diseases <- list(HT = c("I10"), Stroke = c("434.91", "I63.50"))
#  data_enc_disease <-  convert_enc(d = data_enc, keep = FALSE, codes_to_find = diseases, nThread = 2)
#  
#  #Parse encounter ICD columns and discard original ones, and create indicator variables for the following diseases and summarize per patient, whether there are any encounters where the given diseases were registered
#  diseases <- list(HT = c("I10"), Stroke = c("434.91", "I63.50"))
#  data_enc_disease <-  convert_enc(d = data_enc, keep = FALSE, codes_to_find = diseases, nThread = 2, collapse = "ID_MERGE", time_type = "earliest")

## ----convert_dia--------------------------------------------------------------
#  #Search for Hypertension and Stroke ICD codes
#  diseases <- list(HT = c("ICD10:I10"), Stroke = c("ICD9:434.91", "ICD9:I63.50"))
#  data_dia_parse <- convert_dia(d = data_dia, codes_to_find = diseases, nThread = 2)
#  
#  #Search for Hypertension and Stroke ICD codes and summarize per patient providing earliest time
#  diseases <- list(HT = c("ICD10:I10"), Stroke = c("ICD9:434.91", "ICD9:I63.50"))
#  data_enc_disease <-  convert_dia(d = data_dia, codes_to_find = diseases, nThread = 2, collapse = "ID_MERGE", time_type = "earliest")

## ----convert_rfv--------------------------------------------------------------
#  #Parse reason for visit columns and create indicator variables for the following reasons and summarize per patient, whether there are any encounters where the given reasons were registered
#  reasons <- list(Pain = c("ERFV:160357", "ERFV:140012"), Visit = c("ERFV:501"))
#  data_rfv_disease <-  convert_rfv(d = data_rfv, keep = FALSE, codes_to_find = reasons, nThread = 2, collapse = "ID_MERGE")

## ----convert_lab--------------------------------------------------------------
#  #Convert loaded lab results
#  data_lab_pretty <- convert_lab(d = data_lab)
#  data_lab_pretty[, c("lab_result", "lab_result_pretty", "lab_result_range", "lab_result_abn_pretty")]

## ----convert_med--------------------------------------------------------------
#  #Define medication group and add an indicator column whether the given medication group was administered
#  meds <- list(statin = c("Simvastatin", "Atorvastatin"),
#               NSAID  = c("Acetaminophen", "Paracetamol"))
#  
#  data_med_indic <- convert_med(d = data_med, codes_to_find = meds, nThread = 2)
#  data_med_indic[, c("statin", "NSAID")]
#  
#  #Summarize per patient if they ever had the given medication groups registered
#  data_med_indic_any <- convert_med(d = data_med, codes_to_find = meds, collapse = "ID_MERGE", nThread = 2, time_type = "earliest")

## ----convert_notes------------------------------------------------------------
#  #Create columns with specific parts of the radiological report defined by anchors
#  data_rad_parsed <- convert_notes(d = data_rad, code = "rad_rep_txt", anchors = c("Exam Code", "Ordering Provider", "HISTORY", "Associated Reports", "Report Below", "REASON", "REPORT", "TECHNIQUE", "COMPARISON", "FINDINGS", "IMPRESSION", "RECOMMENDATION", "SIGNATURES", "report_end"), nThread = 2)

## ----find_exam----------------------------------------------------------------
#  #Filter encounters for first emergency visits at one of MGH's ED departments
#  data_enc_ED <- data_enc[enc_clinic == "MGH EMERGENCY (10020010608)"]
#  data_enc_ED <- data_enc_ED[!duplicated(data_enc_ED$ID_MERGE)]
#  
#  #Find all radiological examinations within 3 day of the ED registration
#  rdt_ED <- find_exam(d_from = data_rdt, d_to = data_enc_ED, d_from_ID = "ID_MERGE", d_to_ID = "ID_MERGE", d_from_time = "time_rdt_exam", d_to_time = "time_enc_admit", time_diff_name = "time_diff_ED_rdt", before = TRUE, after = TRUE, time = 3, time_unit = "days", multiple = "all", nThread = 2, shared_RAM = FALSE)
#  
#  #Find earliest radiological examinations within 3 day of the ED registration
#  rdt_ED <- find_exam(d_from = data_rdt, d_to = data_enc_ED, d_from_ID = "ID_MERGE", d_to_ID = "ID_MERGE", d_from_time = "time_rdt_exam", d_to_time = "time_enc_admit", time_diff_name = "time_diff_ED_rdt", before = TRUE, after = TRUE, time = 3, time_unit = "days", multiple = "earliest", nThread = 2, shared_RAM = FALSE)
#  
#  #Find closest radiological examinations on or after 1 day of the ED registration and add primary diagnosis column from encounters
#  rdt_ED <- find_exam(d_from = data_rdt, d_to = data_enc_ED, d_from_ID = "ID_MERGE", d_to_ID = "ID_MERGE", d_from_time = "time_rdt_exam", d_to_time = "time_enc_admit", time_diff_name = "time_diff_ED_rdt", before = FALSE, after = TRUE, time = 1, time_unit = "days", multiple = "earliest", add_column = "enc_diag_princ", nThread = 2, shared_RAM = FALSE)
#  
#  #Find closest radiological examinations on or after 1 day of the ED registration but also provide empty rows for patients with exam data but not within the timeframe
#  rdt_ED <- find_exam(d_from = data_rdt, d_to = data_enc_ED, d_from_ID = "ID_MERGE", d_to_ID = "ID_MERGE", d_from_time = "time_rdt_exam", d_to_time = "time_enc_admit", time_diff_name = "time_diff_ED_rdt", before = FALSE, after = TRUE, time = 1, time_unit = "days", multiple = "earliest", add_column = "enc_diag_princ", keep_data = TRUE, nThread = 2, shared_RAM = FALSE)

## ----convert_enc_timeframe----------------------------------------------------
#  #Filter encounters for first emergency visits at one of MGH's ED departments
#  data_enc_ED <- data_enc[enc_clinic == "MGH EMERGENCY (10020010608)"]
#  
#  #Create new column adding a time stamp to ID if individual had multiple encounters
#  data_enc_ED$ID_MERGE_time <- paste0(data_enc_ED$ID_MERGE, "_", data_enc_ED$time_enc_admit)
#  
#  #Find all encounters within 30 days after the registration to ED
#  data_enc_ED_30d <- find_exam(d_from = data_enc, d_to = data_enc_ED, d_from_ID = "ID_MERGE", d_to_ID = "ID_MERGE", d_from_time = "time_enc_admit", d_to_time = "time_enc_admit", time_diff_name = "time_diff_ED_enc", before = FALSE, after = TRUE, time = 30, time_unit = "days", multiple = "all", add_column = "ID_MERGE_time", keep_data = FALSE, nThread = 2)
#  
#  #Combine encounters and search if any of them registered a given diagnosis for each ID and admission time unique ID and return the earliest date of occurrence
#  enc_cols <- colnames(data_enc)[19:30]
#  diseases <- list(HT = c("I10"), Stroke = c("434.91", "I63.50"))
#  
#  data_enc_ED_30d_summ <- convert_enc(d = data_enc_ED_30d, code = enc_cols, keep = FALSE, codes_to_find = diseases, collapse = "ID_MERGE_time", nThread = 2)
#  
#  #Merge original encounter data with 30 day summary data
#  data_enc_ED_ALL <- data.table::merge.data.table(x = data_enc_ED, y = data_enc_ED_30d_summ, by = "ID_MERGE_time", all.x = TRUE, all.y = FALSE)

