#include <assert.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char **argv)
{
    if (argc != 2)
    {
        printf("specify file name\n");
        exit(-1);
    }

    int fd = open(argv[1], O_RDWR);

    struct stat st;
    int fsfd = fstat(fd, &st);
    assert(fsfd >= 0);

    void *ptr = mmap(NULL, st.st_size,
                     PROT_EXEC,
                     MAP_PRIVATE,
                     fd, 0);

    assert(ptr != MAP_FAILED);
    close(fd);

    ((void (*)(void))ptr)();

    printf("Jumped back...\n");

    return 0;
}
