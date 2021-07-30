import html2pdf from 'html2pdf.js'

export default {
  methods: {
    async exportToPdfMixin(el, filename = 'output') {
        const curDate = new Date().toLocaleString().replace(', ', '_').replace(/\./g, '-').replace(/\:/g, '-')

        let pdfContent = el.cloneNode(true)
        pdfContent.classList.add('pdf-view')
        el.style.marginBottom = '100vh'
        document.querySelector('.app-page').appendChild(pdfContent)

        const opt = {
          margin: 12,
          filename: `${filename}_${curDate}`,
          image: { type: 'jpeg', quality: 1 },
          html2canvas:  { scale: 3 },
          jsPDF: { unit: 'mm', format: 'a4', orientation: 'landscape' }
        }

        await html2pdf().set(opt).from(pdfContent).save()

        pdfContent.remove()
        el.style.marginBottom = '0'
    }
  }
}