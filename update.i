# 1 "update.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "update.c"
# 1 "myLib.h" 1
typedef unsigned char u8;
typedef unsigned int u32;
# 13 "myLib.h"
typedef unsigned short u16;
# 52 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;




void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, unsigned short color);
void fillScreen3(unsigned short color);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(unsigned char color);

void drawBackgroundImage4(const unsigned short* image);
void drawImage4(const unsigned short* image, int row, int col, int height, int width);
void drawSubImage4(const unsigned short* sourceImage, int sourceRow, int sourceCol,
       int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);
void loapMap();
void initialize();

void waitForVblank();

void goToStart();
void goToGame();
void goToPause();
void goToLose();
void goToWin();

void start();
void game();
void pause();
void lose();
void win();
# 121 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 160 "myLib.h"
enum {IDLE, CHASE, FLEE};
# 257 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 349 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;

typedef struct
{
 int row;
 int col;
 int oldRow;
 int oldCol;
 int rdel;
 int cdel;
 int width;
 int height;
    int hide;
    int isJumping;
    int racc;
    int maxRSpeed;
    int currFrame;
    int aniState;
    int active;
    int invincible;

} SPRITE;

typedef struct
{
 int row;
 int col;
 int oldRow;
 int oldCol;
 int height;
 int width;
 int active;
 int cdel;
 int rdel;
 int clearFlag;
 int caught;
    int currFrame;
} OBSTACLE;

typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
} SOUND;
# 2 "update.c" 2
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdio.h" 1 3
# 29 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdio.h" 3
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 15 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 16 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/features.h" 1 3
# 6 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 17 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 30 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdio.h" 2 3





# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 43 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
# 27 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3

# 27 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 41 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 63 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 89 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 120 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 146 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 168 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 186 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 200 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 44 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3

# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 216 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 46 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 36 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 149 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 328 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 37 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdio.h" 2 3


# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdarg.h" 1 3 4
# 40 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 40 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdio.h" 2 3







# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 15 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 12 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3
# 13 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3




# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdint.h" 1 3 4
# 9 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdint.h" 3 4
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 14 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int8_t int8_t ;
typedef __uint8_t uint8_t ;




typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int16_t int16_t ;
typedef __uint16_t uint16_t ;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int32_t int32_t ;
typedef __uint32_t uint32_t ;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int64_t int64_t ;
typedef __uint64_t uint64_t ;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 74 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 84 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 94 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 104 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 153 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int intmax_t;
# 162 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long unsigned int uintmax_t;






typedef __intptr_t intptr_t;
typedef __uintptr_t uintptr_t;
# 10 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdint.h" 2 3 4
# 6 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 14 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long _off_t;



typedef int __dev_t;



typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



__extension__ typedef long long _off64_t;







typedef long _fpos_t;
# 55 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 67 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 357 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 68 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;
# 16 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 91 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 115 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 179 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (* _read) (struct _reent *, void *, char *, int)
                                          ;
  int (* _write) (struct _reent *, void *, const char *, int)

                                   ;
  _fpos_t (* _seek) (struct _reent *, void *, _fpos_t, int);
  int (* _close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 285 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 317 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 569 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];

  int _current_category;
  const char *_current_locale;

  int __sdidinit;

  void (* __cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
};
# 762 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 48 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/types.h" 1 3
# 69 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/types.h" 3
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 70 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/machine/types.h" 1 3
# 19 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/machine/types.h" 3
typedef long int __off_t;
typedef int __pid_t;

__extension__ typedef long long int __loff_t;
# 71 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 93 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef unsigned char u_char;



typedef unsigned short u_short;



typedef unsigned int u_int;



typedef unsigned long u_long;





typedef unsigned short ushort;
typedef unsigned int uint;
typedef unsigned long ulong;



typedef unsigned long clock_t;




typedef long time_t;







struct timespec {
  time_t tv_sec;
  long tv_nsec;
};


struct itimerspec {
  struct timespec it_interval;
  struct timespec it_value;
};


typedef long daddr_t;



typedef char * caddr_t;
# 155 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef unsigned int ino_t;
# 184 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef _off_t off_t;
typedef __dev_t dev_t;
typedef __uid_t uid_t;
typedef __gid_t gid_t;





typedef int pid_t;







typedef long key_t;

typedef _ssize_t ssize_t;
# 217 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef unsigned int mode_t __attribute__ ((__mode__ (__SI__)));




typedef unsigned short nlink_t;
# 244 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef long fd_mask;







typedef struct _types_fd_set {
 fd_mask fds_bits[(((64)+(((sizeof (fd_mask) * 8))-1))/((sizeof (fd_mask) * 8)))];
} _types_fd_set;
# 275 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef unsigned long clockid_t;




typedef unsigned long timer_t;



typedef unsigned long useconds_t;
typedef long suseconds_t;

typedef __uint32_t fsblkcnt_t;
typedef __uint32_t fsfilcnt_t;
# 49 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdio.h" 2 3



typedef __FILE FILE;




typedef _fpos_t fpos_t;





# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/sys/stdio.h" 1 3
# 64 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 164 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdio.h" 3
FILE * tmpfile (void);
char * tmpnam (char *);

char * tempnam (const char *, const char *);

int fclose (FILE *);
int fflush (FILE *);
FILE * freopen (const char *restrict, const char *restrict, FILE *restrict);
void setbuf (FILE *restrict, char *restrict);
int setvbuf (FILE *restrict, char *restrict, int, size_t);
int fprintf (FILE *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int fscanf (FILE *restrict, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int printf (const char *restrict, ...) __attribute__ ((__format__ (__printf__, 1, 2)))
                                                            ;
int scanf (const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 1, 2)))
                                                           ;
int sscanf (const char *restrict, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int vfprintf (FILE *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vprintf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 1, 0)))
                                                            ;
int vsprintf (char *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int fgetc (FILE *);
char * fgets (char *restrict, int, FILE *restrict);
int fputc (int, FILE *);
int fputs (const char *restrict, FILE *restrict);
int getc (FILE *);
int getchar (void);
char * gets (char *);
int putc (int, FILE *);
int putchar (int);
int puts (const char *);
int ungetc (int, FILE *);
size_t fread (void * restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite (const void * restrict , size_t _size, size_t _n, FILE *);



int fgetpos (FILE *restrict, fpos_t *restrict);

int fseek (FILE *, long, int);



int fsetpos (FILE *, const fpos_t *);

long ftell ( FILE *);
void rewind (FILE *);
void clearerr (FILE *);
int feof (FILE *);
int ferror (FILE *);
void perror (const char *);

FILE * fopen (const char *restrict _name, const char *restrict _type);
int sprintf (char *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int remove (const char *);
int rename (const char *, const char *);
# 244 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdio.h" 3
int asiprintf (char **, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
char * asniprintf (char *, size_t *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
char * asnprintf (char *restrict, size_t *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int asprintf (char **restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;

int diprintf (int, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;

int fiprintf (FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int fiscanf (FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int iprintf (const char *, ...) __attribute__ ((__format__ (__printf__, 1, 2)))
                                                            ;
int iscanf (const char *, ...) __attribute__ ((__format__ (__scanf__, 1, 2)))
                                                           ;
int siprintf (char *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int siscanf (const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int snprintf (char *restrict, size_t, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int sniprintf (char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int vasiprintf (char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
char * vasniprintf (char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
char * vasnprintf (char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int vasprintf (char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vdiprintf (int, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vfiprintf (FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vfiscanf (FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int vfscanf (FILE *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int viprintf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 1, 0)))
                                                            ;
int viscanf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 1, 0)))
                                                           ;
int vscanf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 1, 0)))
                                                           ;
int vsiprintf (char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vsiscanf (const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int vsniprintf (char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int vsnprintf (char *restrict, size_t, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int vsscanf (const char *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
# 357 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdio.h" 3
int _asiprintf_r (struct _reent *, char **, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
char * _asniprintf_r (struct _reent *, char *, size_t *, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
char * _asnprintf_r (struct _reent *, char *restrict, size_t *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _asprintf_r (struct _reent *, char **restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _diprintf_r (struct _reent *, int, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _dprintf_r (struct _reent *, int, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fclose_r (struct _reent *, FILE *);
int _fcloseall_r (struct _reent *);
FILE * _fdopen_r (struct _reent *, int, const char *);
int _fflush_r (struct _reent *, FILE *);
int _fgetc_r (struct _reent *, FILE *);
int _fgetc_unlocked_r (struct _reent *, FILE *);
char * _fgets_r (struct _reent *, char *restrict, int, FILE *restrict);
char * _fgets_unlocked_r (struct _reent *, char *restrict, int, FILE *restrict);




int _fgetpos_r (struct _reent *, FILE *, fpos_t *);
int _fsetpos_r (struct _reent *, FILE *, const fpos_t *);

int _fiprintf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fiscanf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
FILE * _fmemopen_r (struct _reent *, void *restrict, size_t, const char *restrict);
FILE * _fopen_r (struct _reent *, const char *restrict, const char *restrict);
FILE * _freopen_r (struct _reent *, const char *restrict, const char *restrict, FILE *restrict);
int _fprintf_r (struct _reent *, FILE *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fpurge_r (struct _reent *, FILE *);
int _fputc_r (struct _reent *, int, FILE *);
int _fputc_unlocked_r (struct _reent *, int, FILE *);
int _fputs_r (struct _reent *, const char *restrict, FILE *restrict);
int _fputs_unlocked_r (struct _reent *, const char *restrict, FILE *restrict);
size_t _fread_r (struct _reent *, void * restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fread_unlocked_r (struct _reent *, void * restrict, size_t _size, size_t _n, FILE *restrict);
int _fscanf_r (struct _reent *, FILE *restrict, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
int _fseek_r (struct _reent *, FILE *, long, int);
int _fseeko_r (struct _reent *, FILE *, _off_t, int);
long _ftell_r (struct _reent *, FILE *);
_off_t _ftello_r (struct _reent *, FILE *);
void _rewind_r (struct _reent *, FILE *);
size_t _fwrite_r (struct _reent *, const void * restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fwrite_unlocked_r (struct _reent *, const void * restrict, size_t _size, size_t _n, FILE *restrict);
int _getc_r (struct _reent *, FILE *);
int _getc_unlocked_r (struct _reent *, FILE *);
int _getchar_r (struct _reent *);
int _getchar_unlocked_r (struct _reent *);
char * _gets_r (struct _reent *, char *);
int _iprintf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int _iscanf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
FILE * _open_memstream_r (struct _reent *, char **, size_t *);
void _perror_r (struct _reent *, const char *);
int _printf_r (struct _reent *, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int _putc_r (struct _reent *, int, FILE *);
int _putc_unlocked_r (struct _reent *, int, FILE *);
int _putchar_unlocked_r (struct _reent *, int);
int _putchar_r (struct _reent *, int);
int _puts_r (struct _reent *, const char *);
int _remove_r (struct _reent *, const char *);
int _rename_r (struct _reent *, const char *_old, const char *_new)
                                          ;
int _scanf_r (struct _reent *, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int _siprintf_r (struct _reent *, char *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _siscanf_r (struct _reent *, const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
int _sniprintf_r (struct _reent *, char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _snprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _sprintf_r (struct _reent *, char *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _sscanf_r (struct _reent *, const char *restrict, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
char * _tempnam_r (struct _reent *, const char *, const char *);
FILE * _tmpfile_r (struct _reent *);
char * _tmpnam_r (struct _reent *, char *);
int _ungetc_r (struct _reent *, int, FILE *);
int _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
char * _vasniprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
char * _vasnprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vdiprintf_r (struct _reent *, int, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vdprintf_r (struct _reent *, int, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _vfprintf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfscanf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _viprintf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int _viscanf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int _vprintf_r (struct _reent *, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int _vscanf_r (struct _reent *, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vsnprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vsprintf_r (struct _reent *, char *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vsscanf_r (struct _reent *, const char *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;



int fpurge (FILE *);
ssize_t __getdelim (char **, size_t *, int, FILE *);
ssize_t __getline (char **, size_t *, FILE *);


void clearerr_unlocked (FILE *);
int feof_unlocked (FILE *);
int ferror_unlocked (FILE *);
int fileno_unlocked (FILE *);
int fflush_unlocked (FILE *);
int fgetc_unlocked (FILE *);
int fputc_unlocked (int, FILE *);
size_t fread_unlocked (void * restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite_unlocked (const void * restrict , size_t _size, size_t _n, FILE *);
# 538 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdio.h" 3
int __srget_r (struct _reent *, FILE *);
int __swbuf_r (struct _reent *, int, FILE *);
# 725 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdio.h" 3

# 3 "update.c" 2
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 2 3





# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 17 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 2 3



# 1 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 29 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;




typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);
int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void * __key, const void * __base, size_t __nmemb, size_t __size, __compar_fn_t _compar)



                                ;
void * calloc (size_t __nmemb, size_t __size) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void * malloc (size_t __size) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 124 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
void qsort (void * __base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void * realloc (void * __r, size_t __size) ;




void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);



float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);

int system (const char *__string);
# 161 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));
# 180 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 211 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);







long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);







unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);
# 246 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 279 "/Users/labeall1/Desktop/Fall2017/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double strtold (const char *restrict, char **restrict);




# 4 "update.c" 2


# 5 "update.c"
extern int vOff;
extern int hOff;

int aniCounter = 0;
int obCounter = 0;

extern volatile unsigned int buttons, oldButtons;


enum {SPONGE, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, ELEVEN};

void updateSpongebob(SPRITE *spongebob)
{
    aniCounter++;




    if(aniCounter % 17 == 0 && ((spongebob->row) >> 8) > 110 && spongebob->aniState == 0)
    {
        if(spongebob->currFrame == 1) {
            spongebob->currFrame = 2;
        } else if(spongebob->currFrame == 2) {
            spongebob->currFrame = 3;
        } else {
            spongebob->currFrame = 1;
        }
    }



    if(((spongebob->row) >> 8) < 110 && spongebob->aniState == 0)
    {
        spongebob->currFrame = 2;
    }



    if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))))
    {

        spongebob->aniState = 8;
        spongebob->currFrame = 0;
    }


    if(spongebob->aniState == 8 && aniCounter % 20 == 0)
    {
        if(spongebob->currFrame == 0) {
            spongebob->currFrame = 1;
        } else {
            spongebob->aniState = 0;
            spongebob->currFrame = 1;
        }
    }



    spongebob->isJumping = 0;

    if((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))))
    {
        spongebob->isJumping = 1;
        spongebob->rdel = -600;
    }

    if(((spongebob->row) >> 8) + spongebob->height < 160 || spongebob->isJumping)
    {
        spongebob->rdel += spongebob->racc;
        spongebob->row += spongebob->rdel;
    }


    if(((spongebob->row) >> 8) > 120)
    {
        spongebob->row = ((120) << 8);
    }

}


int playerCollide(SPRITE *player, OBSTACLE *obstacle)
{

    int obstacleTop = obstacle->row + 10;
    int obstacleBottom = obstacle->row + 16;

    int playerBottom = ((player->row) >> 8) + 28;
    int playerTop = ((player->row) >> 8) + 8;

    int obstacleRight = obstacle->col + 12;
    int obstacleLeft = obstacle->col + 4;

    int playerRight = player->col + player->width - 8;
    int playerLeft = player->col + 4;



    if(playerRight == obstacleLeft && (obstacleBottom <= playerBottom) && (obstacleBottom > playerTop))
    {
        obstacle->currFrame = 4;
        return 1;
    }


    if(playerTop == obstacleBottom && (obstacleRight > playerLeft) && (obstacleLeft < playerRight))
    {
        obstacle->currFrame = 4;
        return 1;
    }



    if(playerRight == obstacleLeft && (obstacleTop <= playerBottom) && (obstacleTop > playerTop))
    {
        obstacle->currFrame = 4;
        return 1;
    }

    if(playerBottom == obstacleTop && (obstacleRight > playerLeft) && (obstacleLeft < playerRight))
    {
        obstacle->currFrame = 4;
     return 1;
    }

    return 0;
}

int catchJellyfish(SPRITE *player, OBSTACLE *obstacle)
{
    int netTop = ((player->row) >> 8) + 12;
    int netBottom = ((player->row) >> 8) + 24;

    int netLeft = player->col + 24;
    int netRight = player->col + 28;

    int obstacleTop = obstacle->row;
    int obstacleBottom = obstacle->row + 14;

    int obstacleRight = obstacle->col + 12;
    int obstacleLeft = obstacle->col + 4;

    if(netRight == obstacleLeft && (obstacleBottom <= netBottom) && (obstacleBottom > netTop))
    {
        return 1;
    }

    if(netTop == obstacleBottom && (obstacleRight > netLeft) && (obstacleLeft < netRight))
    {
        return 1;
    }

    if(netRight == obstacleLeft && (obstacleTop <= netBottom) && (obstacleTop > netTop))
    {
        return 1;
    }

    if(netBottom == obstacleTop && (obstacleRight > netLeft) && (obstacleLeft < netRight))
    {
        return 1;
    }

    return 0;
}

int playerOffScreen(SPRITE *player)
{

    if(((player->row) >> 8) + player->height < 0)
    {
        return 1;
    }

    return 0;
}



void updatePlusFive(SPRITE* plusFive)
{
    plusFive->oldRow = plusFive->row;
    plusFive->oldCol = plusFive->col;
    plusFive->row--;

    if(plusFive->row <= 20)
    {
        plusFive->active = 0;
    }
}


void updateObstacle(OBSTACLE* obstacle)
{
    obCounter++;
 obstacle->oldRow = obstacle->row;
 obstacle->oldCol = obstacle->col;
 obstacle->col--;

 if(obstacle->col <= 0)
 {
  obstacle->active = 0;
 }

    if(obCounter % 23 == 0)
    {
        if(obstacle->currFrame == 0) {
            obstacle->currFrame = 2;
        } else {
            obstacle->currFrame = 0;
        }
    }
}


void spawnObstacle(OBSTACLE* obstacle)
{
 obstacle->active = 1;
 int random = (rand() % 90);
 obstacle->col = 240 - obstacle->width;
 obstacle->row = 130 - random;
}
