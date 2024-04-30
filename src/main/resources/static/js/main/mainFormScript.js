/*// 스크롤 효과
let lastScrollTop = 0;

document.querySelector('.mainFormContainer').addEventListener('scroll', function() {
    const sections = document.querySelectorAll('.section');
    let currentSection = 0;

    const scrollTop = this.scrollTop;
    const direction = scrollTop > lastScrollTop ? 'down' : 'up';
    lastScrollTop = scrollTop;

    sections.forEach((section, index) => {
        const rect = section.getBoundingClientRect();
        if (
            // 스크롤 방향이 아래로이고 섹션이 화면 안에 있는 경우
            (direction === 'down' && rect.bottom <= window.innerHeight && rect.bottom > 0) ||
            // 스크롤 방향이 위로이고 섹션이 화면 안에 있는 경우
            (direction === 'up' && rect.top >= 0 && rect.top < window.innerHeight)
        ) {
            currentSection = index;
        }
    });
    
    // 한 번에 한 페이지씩 스크롤
    const container = document.querySelector('.mainFormContainer');
    const pageHeight = container.clientHeight;
    const scrollTo = currentSection * pageHeight;
    container.scrollTo({
        top: scrollTo,
        behavior: 'smooth'
    });
});
*/