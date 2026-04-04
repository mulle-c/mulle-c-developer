## 0.20.0



feature: add portable global/export macros to project templates

* project templates now provide ``<|PROJECT_UPCASE_IDENTIFIER|>`_GLOBAL_VAR` and a standardized ``<|PROJECT_UPCASE_IDENTIFIER|>`_GLOBAL` to ensure globals/functions export correctly on Windows and other platforms
* demo/template headers updated for portability and clarity (removed placeholder shared-library stub; fixed typos)
* add developer documentation TOC (asset/dox/TOC.md)
