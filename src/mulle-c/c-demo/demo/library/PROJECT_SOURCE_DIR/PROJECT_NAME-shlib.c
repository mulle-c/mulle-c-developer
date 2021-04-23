/*
 * The required "anything linkable symbol" to get a shared C library going
 * If you don't need it:
 *
 *    rm <|PROJECT_NAME|>_shlib.c
 *    mulle-sde reflect
 *
 * template: demo/library/PROJECT_SOURCE_DIR/PROJECT_NAME-shlib.h
 * vendor/extension: mulle-c-developer/c-demo
 */
int   __<|PROJECT_DOWNCASE_IDENTIFIER|>_unused__ = 1848;
