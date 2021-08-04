import html2pdf from 'html2pdf.js'

export default {
  methods: {
    async exportToPdfMixin(el, filename = 'output') {
        const curDate = this.moment(new Date()).format('YYYY-MM-DD_HH-mm')

        let pdfContent = el.cloneNode(true)
        pdfContent.classList.add('pdf-view')
        el.style.marginBottom = '100vh'
        document.querySelector('.app-page').appendChild(pdfContent)

        const opt = {
          margin: 12,
          filename: `${filename}__${curDate}`,
          image: { type: 'jpeg', quality: 1 },
          html2canvas:  { dpi: 75, scale: 2, letterRendering: true },
          jsPDF: { unit: 'mm', format: 'a4', orientation: 'landscape', compressPDF: true },
          pagebreak: { mode: ['css', 'legacy'] }
        }

        await html2pdf().from(pdfContent).set(opt).toPdf().get('pdf').then((pdf) => {
          const totalPages = pdf.internal.getNumberOfPages()
          for (var i = 1; i <= totalPages; i++) {
            pdf.setPage(i)
            pdf.setFontSize(10);
            pdf.text(`${i}/${totalPages}`, 280, 202)
          }
        }).save()

        pdfContent.remove()
        el.style.marginBottom = '0'
    }
  }
}