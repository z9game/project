// 스크롤 효과
let lastScrollTop = 0;

document.querySelector('.container').addEventListener('scroll', function() {
    const sections = document.querySelectorAll('.section');
    let currentSection = 0;

    const scrollTop = this.scrollTop;
    const direction = scrollTop > lastScrollTop ? 'down' : 'up';
    lastScrollTop = scrollTop;

    sections.forEach((section, index) => {
        const rect = section.getBoundingClientRect();
        if (direction === 'down' && rect.top >= 0 && rect.bottom <= window.innerHeight) {
            currentSection = index;
        } else if (direction === 'up' && rect.bottom <= window.innerHeight && rect.bottom > 0) {
            currentSection = index;
        }
    });
    
    // 한 번에 한 페이지씩 스크롤
    const container = document.querySelector('.container');
    const pageHeight = container.clientHeight;
    const scrollTo = currentSection * pageHeight;
    container.scrollTo({
        top: scrollTo,
        behavior: 'smooth'
    });
});