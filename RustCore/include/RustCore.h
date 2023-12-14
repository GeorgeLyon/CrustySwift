#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

uintptr_t rust_add(uintptr_t left, uintptr_t right);

void rust_capnp_add(const uint8_t *request_bytes,
                    uintptr_t request_len,
                    uint8_t *response_bytes,
                    uintptr_t response_len);
