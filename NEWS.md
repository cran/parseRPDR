# Change log


## parseRPDR 0.1.0 - 2021/05/09

-   Now support **Rfv** and all note type files:
    **Car, Dis, End, Hnp, Opn, Pat, Prg, Pul, Rad and Vis**
    using a single function: **load_notes**. Therefore,
    previous note related load functions have been removed.

-   Added **convert_rfv** functionality.

-   Now all notes files may be parsed using the
    **convert_notes** function. Therefore,
    previous note related convert functions have been removed.

-   For all datasources Clinic and Hospital names are not modified 
    in any way so they are identical to the ones in RPDR, 
    only missing values are changed to NA.
    
-   In functions parsing notes, exact matches are used for efficiency.

-   Bug-fix: load_dia did not load the encounter number of the record.

-   Bug-fix: parsing of notes has changed as in case of large files
    it caused memory issues.
    
-   Bug-fix: all columns are read as character as large MRNs interpreted
    as integers may cause problems.

## parseRPDR 0.0.2 - 2021/04/16

-   Upon attaching the package the *future.globals.maxSize* is set to
    100Gb to allow for parallel processing of large datasets on windows
    machines and also when using the shared memory version of the
    **find_exam** function.

-   Upon attaching the package the data.table *setDTthreads* is set to
    1, so that there are no problems for parallel processing. Set
    *data.table::setDTthreads()* manually after the you are done with
    using parseRPRD, if you wish to use multi-thread processing of
    data.table in other tasks.
    
-   Timezone attributes are removed from POSIXct times as they may
    cause problems if working on different OS in different timezones.
    
-   In the **find_exam** function time variables are first truncated 
    to the precision of *time_unit* argument using the *trunc.POSIXt*
    function for consistency, and then time differences are calculated
    using the *difftime* function.

-   Bug-fix: In case lab values were recorded as having “\>” or “\<”
    signs and the value was equal to the normal range i.e. value:
    \<0.01, normal range: \<0.01, then these values are considered as
    *NORMAL*.

-   Technical-fix: removed *..* calls from functions so that only simple
    calls are present.
